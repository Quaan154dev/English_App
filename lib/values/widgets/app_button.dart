import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_pra/pages/control_page.dart';
import 'package:flutter_app_pra/values/app_styles.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ControlPage()));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, offset: Offset(3, 6), blurRadius: 6)
            ],
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(label,
            style: AppStyle.h5.copyWith(
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
