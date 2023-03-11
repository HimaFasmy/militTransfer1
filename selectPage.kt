package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class selectPage : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_select_page)

        var sel = findViewById<Button>(R.id.enDe)
        sel.setOnClickListener{
            val intent = Intent(this, fingerPage::class.java)
            startActivity(intent)
        }


        var about = findViewById<Button>(R.id.Abt)
        about.setOnClickListener{
            val intent = Intent(this, aboutPage::class.java)
            startActivity(intent)
        }
    }
}