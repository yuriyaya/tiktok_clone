import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchSubmitted(String value) {
    print(_textEditingController.text);
    setState(() {
      _isWriting = false;
    });
  }

  bool _isWriting = false;

  void _onStartSearch() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onClearSearch() {
    // clear search text
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Sizes.size44,
                      child: TextField(
                        controller: _textEditingController,
                        onTap: _onStartSearch,
                        onSubmitted: _onSearchSubmitted,
                        textInputAction: TextInputAction.search,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size4,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                            horizontal: Sizes.size12,
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.black,
                                size: Sizes.size20,
                              ),
                            ],
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_isWriting)
                                GestureDetector(
                                  onTap: _onClearSearch,
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircleXmark,
                                    color: Colors.grey.shade500,
                                    size: Sizes.size20,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            elevation: 1,
            bottom: TabBar(
              onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
              isScrollable: true,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 20,
                ),
                itemCount: 20,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/images.jpeg",
                            image:
                                "https://images.unsplash.com/photo-1676845578082-2e08e7c359b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that im uploading now currently",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/19943852?s=96&v=4",
                            ),
                          ),
                          Gaps.h8,
                          const Expanded(
                            child: Text(
                              "my_user_name_is_very_long",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Gaps.h8,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text("11.0K"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(tab),
                )
            ],
          ),
        ),
      ),
    );
  }
}
