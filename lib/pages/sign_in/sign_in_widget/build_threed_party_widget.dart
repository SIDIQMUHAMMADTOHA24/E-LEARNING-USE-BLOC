import '../../export.dart';

class BuildThreedParty extends StatelessWidget {
  const BuildThreedParty({
    super.key,
    required this.nameIcons,
  });

  final String nameIcons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: Image.asset('assets/icons/$nameIcons.png'),
    );
  }
}
