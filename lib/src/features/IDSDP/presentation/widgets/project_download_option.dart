import 'package:collection/collection.dart';
import 'package:ek_sheba/src/common/widgets/icon_button.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter/material.dart';

// this page is used on  [ProjectDetailsPage]
class ProjectDownloadOptions extends StatelessWidget {
  const ProjectDownloadOptions({
    super.key,
    required this.project,
  });

  final ProjectDetails project;

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "অংশ-ক (প্রকল্পের সার-সংক্ষেপ)",
      "অংশ-খ (প্রকল্পের বিস্তারিত বর্ণনা)",
      "সংযোজনী-১ (প্রকল্প এলাকাভিত্তিক ব্যয় বিভাজন)",
      "সংযোজনী-২ (প্রকল্পের জনবল কাঠামো)",
      "সংযোজনী-৩ (ক) পন্য (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)",
      "সংযোজনী-৩ (খ) পুর্ত কাজ (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)",
      "সংযোজনী-৩ (গ) সেবা (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)",
      "সংযোজনী-৪ (বছরভিত্তিক আর্থিক ও বাস্তব পরিকল্পনা)",
      "সংযোজনী-৫ (ক) (প্রাক্কলিত ব্যয়ের বিস্তারিত বিবরণী)",
      "সংযোজনী-৫ (খ) (প্রাক্কলিত ব্যয়ের বছরভিত্তিক বিস্তারিত বিবরণী)",
      "সংযোজনী-৬ (জিওবি গৃহীত ঋণ পরিশোধ সিডিউল)",
      "সংযোজনী-৭ (মধ্যমেয়াদি বাজেট কাঠামো)",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "ডিপিপি প্রকল্পের অংশ ডাউনলোড করুন",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Spacer(),
            AppIconButton(onTap: () {}, icon: Icons.chat, label: "মন্তব্য / পর্যবেক্ষণ"),
          ],
        ),
        SizedBox(height: 16),
        for (int i = 0; i < (items.length / 2 + items.length % 2); i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                _BuildDownOptionCard(title: items[i], onTap: () {}),
                const SizedBox(width: 4),
                _BuildDownOptionCard(title: items[i + 2], onTap: () {}),
              ],
            ),
          ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF61AB9E),
          ),
          onPressed: () {},
          child: Text("সম্ভাব্যতা যাচাই প্রতিবেদন ডাউনলোড করুন"),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _BuildDownOptionCard extends StatelessWidget {
  const _BuildDownOptionCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 64,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAAE5D0),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    right: 2,
                  ),
                  child: Icon(
                    Icons.forward,
                    size: 12,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
