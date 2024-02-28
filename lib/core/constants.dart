import 'package:logger/logger.dart';

final logger = Logger();

const double baseHeight = 812.0;
const double baseWidth = 375.0;
const String employeeCollection = 'employees';
const String materialCollection = 'materials';
const String clientCollection = 'clients';
const String attendanceCollection = 'attendance';
const String employeeId = 'employeeId';
const String kToken = 'token';
const String kLanguage = 'language';
const String kStudent = 'Student';
const String kTeacher = 'Teacher';
const String kType = 'Type';
const String kUser = 'User';
const double kAspectRatio = 17 / 9.1;

enum UserType { kStudent, kTeacher }
