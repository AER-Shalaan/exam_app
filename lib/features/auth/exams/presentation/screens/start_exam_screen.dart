import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:gap/gap.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.baseBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.assignment, size: 30, color: Colors.grey),
                ),
                const Gap(12),
                const Expanded(
                  child: Text(
                    'Languages',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.baseBlack,
                    ),
                  ),
                ),
                const Text(
                  '30 Minutes',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                const Text(
                  'High level',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseBlack,
                  ),
                ),
                const Gap(8),
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Gap(8),
                Text(
                  '20 Question',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const Gap(24),
            Divider(color: Colors.grey.shade300, thickness: 1),
            const Gap(24),
            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlack,
              ),
            ),
            const Gap(16),
            _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
            _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
            _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
            _buildInstructionItem('Lorem ipsum dolor sit amet consectetur.'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // Action to start exam
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Gap(24), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
