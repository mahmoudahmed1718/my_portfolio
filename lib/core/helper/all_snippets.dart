import 'package:flutter/material.dart';
import 'package:portfolio/core/entites/snpittes_entity.dart';

final List<SnippetEntity> allSnippets = [
  SnippetEntity(
    title: 'Flutter Clean Architecture',
    description:
        'A base Flutter project using Clean Architecture with Cubit & Dependency Injection.',
    code: '''
abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> call(Params params);
}

class GetUser extends UseCase<User, int> {
  final UserRepository repository;
  GetUser(this.repository);

  @override
  Future<User> call(int id) async {
    return await repository.getUserById(id);
  }
}''',
    stars: 14,
    icons: [Icons.layers, Icons.flutter_dash],
  ),
  SnippetEntity(
    title: 'Flutter Firebase Auth',
    description:
        'A simple and effective authentication flow using Firebase Auth & Cubit.',
    code: '''
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  AuthCubit(this._auth) : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } catch (_) {
      emit(AuthFailure());
    }
  }
}''',
    stars: 12,
    icons: [Icons.security, Icons.person],
  ),
  SnippetEntity(
    title: 'Flutter Adaptive Layout',
    description: 'Build responsive UIs using LayoutBuilder & MediaQuery.',
    code: '''
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DesktopLayout();
      } else {
        return MobileLayout();
      }
    },
  );
}''',
    stars: 11,
    icons: [Icons.devices, Icons.grid_view],
  ),
  SnippetEntity(
    title: 'Cubit + Dio API Call',
    description: 'Manage API state with Cubit and Dio in a clean way.',
    code: '''
class PostCubit extends Cubit<PostState> {
  final Dio dio;
  PostCubit(this.dio) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final response = await dio.get('/posts');
      emit(PostLoaded(response.data));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}''',
    stars: 9,
    icons: [Icons.http, Icons.sync],
  ),
  SnippetEntity(
    title: 'WebSocket Chat with Cubit',
    description: 'Create real-time chat using WebSocket and state management.',
    code: '''
class ChatCubit extends Cubit<List<String>> {
  final WebSocketChannel channel;

  ChatCubit(this.channel) : super([]) {
    channel.stream.listen((message) {
      emit([...state, message]);
    });
  }

  void sendMessage(String message) {
    channel.sink.add(message);
  }
}''',
    stars: 10,
    icons: [Icons.chat_bubble, Icons.web],
  ),
  SnippetEntity(
    title: 'Flutter Form Validation',
    description: 'A simple login form with validation using GlobalKey.',
    code: '''
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)''',
    stars: 6,
    icons: [Icons.input, Icons.check_circle],
  ),
  SnippetEntity(
    title: 'Custom AnimationController',
    description:
        'A simple animation using AnimationController and AnimatedBuilder.',
    code: '''
class MyAnimatedBox extends StatefulWidget {
  @override
  _MyAnimatedBoxState createState() => _MyAnimatedBoxState();
}

class _MyAnimatedBoxState extends State<MyAnimatedBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 100, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        );
      },
    );
  }
}''',
    stars: 8,
    icons: [Icons.animation, Icons.play_circle_fill],
  ),
];
