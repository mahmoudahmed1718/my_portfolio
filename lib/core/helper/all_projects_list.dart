import 'package:portfolio/core/entites/project_entity.dart';
import 'package:portfolio/core/utils/assets.dart';

const List<ProjectEntity> allProjects = [
  ProjectEntity(
    url: 'https://github.com/abd0-kha1ed/path_tracker',
    imagePath: Assets.imagesPathTracker,
    type: 'Robot Controller',
    title: 'Path Tracker',
    description:
        'A Flutter-based mobile app that controls a ground-tracking robot. It displays real-time data such as speed, obstacle distance, and robot status, and allows interactive control of movement and path tracking.',
  ),
  ProjectEntity(
    url: 'https://github.com/abd0-kha1ed/lms',
    imagePath: Assets.imagesLms,
    type: 'Flutter LMS',
    title: 'Learning Platform',
    description:
        'Flutter LMS built for students and teachers with clean architecture and state management.',
  ),
  ProjectEntity(
    url: 'https://github.com/abd0-kha1ed/attendance-system',
    imagePath: Assets.imagesAttendance,
    type: 'Attendance System',
    title: 'Flutter Attendance',
    description:
        'A Flutter-based attendance system that allows teachers to manage student attendance efficiently.',
  ),

  ProjectEntity(
    url: 'https://github.com/mahmoudahmed1718/ecommerce',
    imagePath: Assets.imagesFruitHub,
    type: 'Fruit Hub',
    title: 'E-Commerce App',
    description:
        'Fruit Hub is a sleek and user-friendly Flutter-based eCommerce app for browsing and buying fresh fruits online',
  ),
  ProjectEntity(
    url: 'https://github.com/mahmoudahmed1718/ecommercedash',
    imagePath: Assets.imagesEcommerceDashboard,
    type: 'Fruit Hub Admin Dashboard',
    title: 'eCommerce Dashboard',
    description:
        'An intuitive Flutter-powered eCommerce dashboard for managing products, orders, and customers with ease',
  ),
  ProjectEntity(
    url: 'https://github.com/mahmoudahmed1718',
    imagePath: Assets.imagesQuotes,
    type: 'Quotes App',
    title: 'Quotes App',
    description:
        'A beautifully designed Flutter app that delivers daily inspirational and motivational quotes.',
  ),
];
