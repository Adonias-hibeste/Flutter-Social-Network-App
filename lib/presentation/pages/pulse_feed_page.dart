import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PulseFeedPage extends StatelessWidget {
  const PulseFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildBackgroundGradients(),
          ListView(
            padding: const EdgeInsets.only(top: 120),
            children: [
              _buildStories(),
              const SizedBox(height: 24),
              _buildPostCard('Maya, 26', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2', 'Golden hour in the city 🌅 #aesthetic'),
              _buildPostCard('Alex Rivers', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e', 'New workspace setup is finally complete! 💻'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            backgroundColor: Colors.white.withOpacity(0.05),
            elevation: 0,
            title: const Text('Pulse', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -1)),
            actions: [
              IconButton(icon: const Icon(LucideIcons.send, size: 20), onPressed: () {}),
              IconButton(icon: const Icon(LucideIcons.bell, size: 20), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundGradients() {
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -100,
          child: Container(width: 300, height: 300, decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2), shape: BoxShape.circle)),
        ),
        Positioned(
          bottom: 200,
          left: -150,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle)),
        ),
      ],
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
              border: Border.all(color: Colors.transparent, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipOval(child: Image.network('https://i.pravatar.cc/150?u=$index', fit: BoxFit.cover)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostCard(String user, String image, String caption) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://i.pravatar.cc/150')),
                      const SizedBox(width: 12),
                      Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const Icon(LucideIcons.moreHorizontal, size: 18),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(image, height: 300, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(LucideIcons.heart, color: Colors.redAccent, size: 24),
                          SizedBox(width: 16),
                          Icon(LucideIcons.messageCircle, size: 24),
                          SizedBox(width: 16),
                          Icon(LucideIcons.share2, size: 24),
                          Spacer(),
                          Icon(LucideIcons.bookmark, size: 24),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(caption, style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 8),
                      const Text('View all 12 comments', style: TextStyle(color: Colors.white38, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(LucideIcons.home, color: Colors.white),
          Icon(LucideIcons.search, color: Colors.white38),
          Icon(LucideIcons.plusSquare, color: Colors.white38),
          Icon(LucideIcons.user, color: Colors.white38),
        ],
      ),
    );
  }
}
