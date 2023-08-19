import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

/// return int from [key] or [NullFailure] for dashboard project count
 int  counterFromKey(dynamic key)   {
  return int.tryParse('$key')??0;
  
}
