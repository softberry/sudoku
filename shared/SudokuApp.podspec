Pod::Spec.new do |spec|
    spec.name                     = 'SudokuApp'
    spec.version                  = '0.0.1'
    spec.homepage                 = 'https://github.com/mirego/your-project'
    spec.source                   = { :http=> ''}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Project summary'
    spec.vendored_frameworks      = 'build/cocoapods/framework/SudokuApp.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '15.0'
    spec.dependency 'Reachability', '~> 3.2'
                
    if !Dir.exist?('build/cocoapods/framework/SudokuApp.framework') || Dir.empty?('build/cocoapods/framework/SudokuApp.framework')
        raise "

        Kotlin framework 'SudokuApp' doesn't exist yet, so a proper Xcode project can't be generated.
        'pod install' should be executed after running ':generateDummyFramework' Gradle task:

            ./gradlew :shared:generateDummyFramework

        Alternatively, proper pod installation is performed during Gradle sync in the IDE (if Podfile location is set)"
    end
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':shared',
        'PRODUCT_MODULE_NAME' => 'SudokuApp',
    }
                
    spec.script_phases = [
        {
            :name => 'Build SudokuApp',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end