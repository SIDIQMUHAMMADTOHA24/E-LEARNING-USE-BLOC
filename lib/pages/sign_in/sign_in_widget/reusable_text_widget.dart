import '../../export.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 15.sp, color: Colors.grey.withOpacity(0.5)),
    );
  }
}
