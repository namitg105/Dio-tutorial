import 'package:dio/dio.dart';
import 'package:dio_tutorial/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void addPosts() async {
    try {
      var response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {"title": "New Post", "body": "BODY OF NEW POST", "userId": 1},
      );
      print("POSt created: ${response.data}");
    } catch (e) {
      print("ERROR $e");
    }
  }

  void fetchPosts() async {
    try {
      var response = await Dio().get(
        'https://dummyjson.com/recipes',
      ); // Dio().get(url of api)
      setState(() {
        posts = response.data;
      });
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*Scaffold(
      appBar: AppBar(title: Text('Posts')),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(posts[index]['title']),
                  subtitle: Text(posts[index]['body']),
                );
              }),
            ),
          ),
          ElevatedButton(onPressed: addPosts, child: Text("Add post")),
        ],
      ),
    );
  }
}
*/