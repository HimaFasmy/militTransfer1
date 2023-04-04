package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.WindowManager
import android.widget.Button


    class coverPage : AppCompatActivity() {
        override fun onCreate(savedInstanceState: Bundle?) {

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

            super.onCreate(savedInstanceState)
            setContentView(R.layout.activity_cover_page)

            supportActionBar?.hide()

            Handler().postDelayed({
                val intent = Intent(this@coverPage, login::class.java)
                startActivity(intent)
                finish()
            }, 1500)
        }
    }

