package com.emresakarya.sudoku.previews

import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext
import androidx.startup.AppInitializer
import com.emresakarya.sudoku.platform.AppContextInitializer

@Composable
fun PreviewContext(content: @Composable () -> Unit) {
    // @Composable previews do not call AppInitializer. We must initialize our components manually.
    AppInitializer.getInstance(LocalContext.current)
        .initializeComponent(AppContextInitializer::class.java)

    content()
}
