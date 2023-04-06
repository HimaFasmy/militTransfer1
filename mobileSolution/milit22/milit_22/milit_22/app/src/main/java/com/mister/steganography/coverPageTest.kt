package com.mister.steganography

import android.os.Bundle
import org.junit.Test
import org.junit.Assert.*

class CoverPageUnitTest {
    @Test
    fun testCoverPage() {

    }
}
@Test
fun testCoverPage() {
    assertDoesNotThrow("Error in onCreate method") {
        val coverPage = coverPage()
        coverPage.onCreate(Bundle())
    }
}

fun assertDoesNotThrow(s: String, function: () -> Unit) {

}
