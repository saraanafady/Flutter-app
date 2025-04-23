import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top AppBar
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, size: 28),
                  Icon(Icons.search, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              // Task Cards
              Expanded(
                child: ListView(
                  children: const [
                    CourseCard(
                      courseName: "VR Course",
                      taskStatus: "13/13 Tasks - 100%",
                      color: Color(0xFF7BE495),
                      avatarImages: [
                        'assets/image1.png',
                        'assets/image2.png',
                      ],
                      imageAsset: 'assets/Virtual reality.png',
                    ),
                    SizedBox(height: 20),
                    CourseCard(
                      courseName: "Community",
                      taskStatus: "2/8 Tasks - 35%",
                      color: Color(0xFF1A1A3F),
                      avatarImages: [
                        'assets/image1.png',
                        'assets/image2.png',
                        'assets/image3.png',
                        'assets/image.png',
                      ],
                      imageAsset: 'assets/Community.png',
                      label: "Ahmed",
                    ),
                    SizedBox(height: 20),
                    CourseCard(
                      courseName: "SMM Course",
                      taskStatus: "4/7 Tasks - 57%",
                      color: Color(0xFFBA6DFF),
                      avatarImages: [
                        'assets/image1.png',
                        'assets/image2.png',
                        'assets/image.png',
                      ],
                      imageAsset: 'assets/Refer a friend.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String taskStatus;
  final Color color;
  final List<String> avatarImages;
  final String imageAsset;
  final String? label;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.taskStatus,
    required this.color,
    required this.avatarImages,
    required this.imageAsset,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Left Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overlapping Avatars
                SizedBox(
                  height: 28,
                  child: Stack(
                    children: avatarImages.asMap().entries.map((entry) {
                      int index = entry.key;
                      String imgPath = entry.value;

                      return Positioned(
                        left: index * 20, // Adjust spacing here
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(imgPath),
                          backgroundColor: Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Text(taskStatus,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(courseName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    if (label != null) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(label!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),

          // Right Image
          Image.asset(
            imageAsset,
            width: 110,
            height: 90,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
