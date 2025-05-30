import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

final obscureProvider = StateProvider.autoDispose.family<bool,String>((ref,id) => true);

class MyTextField extends ConsumerWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isPassword;
  final String id ; 
  const MyTextField({
    super.key,
    this.id = "",
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = ref.watch(obscureProvider(id));
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword ? isObscure : false,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  ref.read(obscureProvider(id).notifier).state = !isObscure;
                },
                icon: ref.read(obscureProvider(id))
                    ? Icon(AntDesign.eye_fill)
                    : Icon(AntDesign.eye_outline),
              )
            : null,
      ),
    );
  }
}
