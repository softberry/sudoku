@file:Suppress("UnstableApiUsage")

pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven("https://s3.amazonaws.com/mirego-maven/public")
    }
}

rootProject.name = "Sudoku"
include(":androidApp")
include(":shared")
