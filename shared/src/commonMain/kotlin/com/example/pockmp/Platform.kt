package com.example.pockmp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform