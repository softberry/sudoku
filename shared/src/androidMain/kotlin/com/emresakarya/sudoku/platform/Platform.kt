package com.emresakarya.sudoku.platform

import android.os.Build
import com.emresakarya.sudoku.common.BuildConfig

actual fun Platform(): Platform = AndroidPlatform()

private class AndroidPlatform : Platform {
    override val system = System(
        name = "Android",
        version = Build.VERSION.SDK_INT.toString()
    )

    override val locale = java.util.Locale.getDefault().let {
        Locale(
            languageCode = it.language,
            regionCode = it.country
        )
    }

    override val version = Version(
        name = BuildConfig.VERSION_NAME,
        code = BuildConfig.VERSION_CODE
    )
}
