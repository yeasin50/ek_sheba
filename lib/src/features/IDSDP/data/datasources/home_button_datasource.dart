import 'package:ek_sheba/gen/assets.gen.dart';

import '../models/button_info.dart';

///while static, directly using variable
final homeButtons = [
  ButtonInfo(
    title: 'Project Processing, Appraisal & Management System',
    imagePath: Assets.images.planning.path,
  ),
  ButtonInfo(
    title: 'National Plan Management System',
    imagePath: Assets.images.resources.path,
  ),
  ButtonInfo(
    title: 'GIS Based Resource Management',
    imagePath: Assets.images.resourcesGis.path,
  ),
  ButtonInfo(
    title: 'Common Service',
    imagePath: Assets.images.commonService.path,
  ),
];
