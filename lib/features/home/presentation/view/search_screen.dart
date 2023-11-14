import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          MediaQuery.of(context).viewPadding.top + 24,
          24,
          24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  hintText: 'جستجو کنید...',
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                /*onTapOutside: (event) => FocusScope.of(context).unfocus(),*/
                autofocus: false,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/search/no_result.png',
                    width: 500,
                    height: 500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
