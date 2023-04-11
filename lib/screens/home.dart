import 'package:flutter/material.dart';
import 'package:news_mobile/uniform_service.dart';
import 'package:news_mobile/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late RootComposition news;
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    _getNews();
    super.initState();
  }

  _getNews() {
    setState(() {
      _isLoading = true;
    });

    UniformService().getNews().then((value) {
      setState(() {
        news = value;
        _isLoading = false;
      });
    }).catchError((onError) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : _isError
            ? const Center(
                child: Text(
                  'Error getting news',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text('News Timeline'),
                  backgroundColor: Colors.black,
                ),
                body: ListView.builder(
                  itemCount: news.composition.slots.news.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: .5, color: Colors.grey),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              news.composition.slots.news[index].parameters
                                  .newsImage.value.url,
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.composition.slots.news[index].parameters
                                      .newsTitle.value,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  news.created.substring(0, 10),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
  }
}
