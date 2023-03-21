package com.mister.steganography

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.mister.steganography.fragment.DecodeFragment
import com.mister.steganography.fragment.EncodeFragment
import kotlinx.android.synthetic.main.activity_main.*

class Decodee : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setuptab()
    }

    private fun setuptab() {
        val adapter =  ViewPagerAdapter(supportFragmentManager)
        // adapter.addFragment(HomeFragment(),"About")
//        adapter.addFragment(EncodeFragment(),"Encode")
        adapter.addFragment(DecodeFragment(),"Decode")


        viewpager.adapter=adapter
        tabs.setupWithViewPager(viewpager)
    }
}