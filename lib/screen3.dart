import 'package:flutter/material.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Tayo's Projects",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Add action logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("All", 17, Colors.teal),
                  const SizedBox(width: 8),
                  _buildFilterChip("To Do", 5, Colors.deepPurple),
                  const SizedBox(width: 8),
                  _buildFilterChip("In Progress", 3, Colors.amber),
                  const SizedBox(width: 8),
                  _buildFilterChip("Done", 2, Colors.grey),
                ],
              ),
            ),
          ),
          // Task Cards List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTaskCard("Create Ad Banner", "2 hours ago", Colors.deepPurple, [
                  'assets/image.png',
                  'assets/image1.png'
                ]),
                const SizedBox(height: 12),
                _buildTaskCard("Create New Blog Post", "3 hours ago", Colors.amber, [
                  'assets/image2.png'
                ]),
                const SizedBox(height: 12),
                _buildTaskCard("Online Course", "5 hours ago", Colors.deepPurple, [
                  'assets/image3.png'
                ]),
                const SizedBox(height: 12),
                _buildTaskCard("Complete Portfolio", "1 day ago", Colors.grey.shade300, [
                  'assets/image.png',
                  'assets/image2.png',
                  'assets/image3.png'
                ]),
                const SizedBox(height: 12),
                _buildTaskCard("Plan For Next Week", "2 days ago", Colors.amber, [
                 'assets/image2.png',
                  'assets/image3.png'
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 233, 231, 231),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String timeAgo, Color dotColor, List<String> imagePaths) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with colored dot and title
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Date and avatars
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(timeAgo, style: const TextStyle(color: Colors.grey)),
              const Spacer(),
              _buildAvatarStack(imagePaths),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack(List<String> images) {
    return SizedBox(
      width: (images.length * 24).toDouble(),
      height: 28,
      child: Stack(
        children: images.asMap().entries.map((entry) {
          int index = entry.key;
          String imgPath = entry.value;
          return Positioned(
            left: index * 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imgPath,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
