package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class coverPage : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_cover_page)

        var cover = findViewById<Button>(R.id.cov)
        cover.setOnClickListener{
            val intent1 = Intent(this, loginPage::class.java)
            startActivity(intent1)
        }
    }
}