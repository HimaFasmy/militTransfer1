package com.mister.steganography

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.WindowManager
import com.mister.steganography.fragment.DecodeFragment
import com.mister.steganography.fragment.EncodeFragment
import kotlinx.android.synthetic.main.activity_main.*

class Decodee : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setuptab()
    }

    // Sets up the tab layout and the view pager
    private fun setuptab() {
        val adapter =  ViewPagerAdapter(supportFragmentManager)
        adapter.addFragment(DecodeFragment(),"Decode")


        viewpager.adapter=adapter
        tabs.setupWithViewPager(viewpager)
    }
}