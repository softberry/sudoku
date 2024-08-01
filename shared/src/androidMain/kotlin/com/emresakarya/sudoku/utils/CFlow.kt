package com.emresakarya.sudoku.utils

import kotlinx.coroutines.flow.Flow

actual class CFlow<T : Any> internal constructor(origin: Flow<T>) : Flow<T> by origin

actual fun <T : Any> Flow<T>.wrap(): CFlow<T> = CFlow(this)
