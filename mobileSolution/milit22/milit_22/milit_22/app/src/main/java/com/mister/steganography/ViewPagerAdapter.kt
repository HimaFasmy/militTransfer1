package com.mister.steganography

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter

class ViewPagerAdapter(supportfragmentmanager: FragmentManager) : FragmentPagerAdapter(supportfragmentmanager, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT){
    // Declare two ArrayLists to hold the fragments and their titles
    private val mFragmentlist = ArrayList<Fragment>()
    private val mFragmentTitleList = ArrayList<String>()

    // Get the fragment at a specific position
    override fun getItem(position: Int): Fragment {
        return mFragmentlist[position]
    }


    // Get the total number of fragments
    override fun getCount(): Int {
        return mFragmentlist.size
    }

    // Get the title of a fragment at a specific position
    override fun getPageTitle(position: Int): CharSequence? {
        return mFragmentTitleList[position]
    }


    // Add a fragment and its title to the ArrayLists
    fun addFragment(fragment : Fragment, title: String){
        mFragmentlist.add(fragment)
        mFragmentTitleList.add(title)
    }
}