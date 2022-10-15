import 'print.dart';

void printInternalError(dynamic error, StackTrace stackTrace) {
  printww(
    'An error occurred:',
  );
  print(error);
  print(stackTrace);
  print('');
}
