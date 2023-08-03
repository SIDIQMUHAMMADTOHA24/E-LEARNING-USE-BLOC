import '../../export.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.hintText,
    required this.iconName,
    required this.onChanged,
  });

  final String hintText;
  final String iconName;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      obscureText: iconName == 'lock',
      obscuringCharacter: '•',
      decoration: InputDecoration(
          prefixIcon: Icon(iconName == 'person' ? Icons.person : Icons.lock,
              color: Colors.black),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}
