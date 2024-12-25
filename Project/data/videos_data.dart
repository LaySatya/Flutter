import '../models/courses.dart';
import '../models/video_lessons.dart';

final videos = [
  Videos(
    id: '1',
    videoUrl: 'https://www.youtube.com/embed/tZZgn_ngjyw?si=jqKo_osruuwfBcTR',
    title: 'Factor',
    description: 'Learn the basics of factorizatio.',
    course: Courses.mathematic,
  ),
  Videos(
    id: '2',
    videoUrl: 'https://www.youtube.com/embed/KVbN7TkuXAE?si=lvkS-mLDkC-SbvFu',
    title: 'Algebra',
    description: 'Learn the basics of algebra.',
    course: Courses.mathematic,
  ),
  Videos(
    id: '3',
    videoUrl: 'https://www.youtube.com/embed/uPPkpm62CBk?si=6L9sZ0dN-YT1iTW1',
    title: 'Geometry',
    description: 'Learn the basics of geometry.',
    course: Courses.mathematic,
  ),
   Videos(
    id: '4',
    videoUrl: 'https://www.youtube.com/embed/s9IGygW9HWY?si=0Ym9NKSBtfFxWPiz',
    title: 'A over B, B oposite 0',
    description: 'Learn basic math to pro.',
    course: Courses.mathematic,
  ),
  // Add more 
  Videos(
    id: '5',
    videoUrl: 'https://www.youtube.com/embed/dg-uDiaKfE0?si=Hzr6m2hFnWCXj9pp',
    title: 'Equation',
    description: 'Quandratic Equation',
    course: Courses.mathematic,
  ),
  // English Course Videos
  // English Course Videos
Videos(
  id: '6',
  videoUrl: 'https://www.youtube.com/watch?v=ig3irLa0eu0',
  title: 'Learn English',
  description: 'beginner English lessons.',
  course: Courses.english,
),
Videos(
  id: '7',
  videoUrl: 'https://www.youtube.com/watch?v=mbtoLCODbZc',
  title: 'Improve your English skills',
  description: 'YouTube channels for enhancing your English.',
  course: Courses.english,
),
Videos(
  id: '8',
  videoUrl: 'https://youtu.be/OoO5d5P0Jn4?si=kJ8lLZKD1SgFzlmC',
  title: 'Crash Course Physics Preview',
  description: 'Physics is coming soon.',
  course: Courses.physic,
),
Videos(
  id: '9',
  videoUrl: 'https://youtu.be/OoO5d5P0Jn4?si=b3ROQHBLdkQtpUZj',
  title: 'Motion in a Straight Line: Crash Course Physics #1',
  description: '',
  course: Courses.physic,
),
Videos(
  id: '10',
  videoUrl: 'https://youtu.be/ObHJJYvu3RE?si=h8cVbGQBHR7VrC76',
  title: 'Derivatives: Crash Course Physics #2',
  description: 'learn derivatives!',
  course: Courses.physic,
),


];