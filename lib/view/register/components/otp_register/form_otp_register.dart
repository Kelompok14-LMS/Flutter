import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormOtpRegister extends StatelessWidget {
  const FormOtpRegister({
    Key? key,
    required this.formKey,
    required this.size,
    required TextEditingController oneController,
    required TextEditingController twoController,
    required TextEditingController threeController,
    required TextEditingController fourController,
  })  : _oneController = oneController,
        _twoController = twoController,
        _threeController = threeController,
        _fourController = fourController,
        super(key: key);

  final GlobalKey<FormState> formKey;
  final Size size;
  final TextEditingController _oneController;
  final TextEditingController _twoController;
  final TextEditingController _threeController;
  final TextEditingController _fourController;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.14,
            child: TextFormField(
              controller: _oneController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => value == '' ? 'Error' : null,
            ),
          ),
          SizedBox(
            width: size.width * 0.14,
            child: TextFormField(
              controller: _twoController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => value == '' ? 'Error' : null,
            ),
          ),
          SizedBox(
            width: size.width * 0.14,
            child: TextFormField(
              controller: _threeController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => value == '' ? 'Error' : null,
            ),
          ),
          SizedBox(
            width: size.width * 0.14,
            child: TextFormField(
              controller: _fourController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => value == '' ? 'Error' : null,
            ),
          ),
        ],
      ),
    );
  }
}