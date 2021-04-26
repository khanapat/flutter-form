import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Widget? title,
    bool initialValue = false,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
  }) : super(
          validator: validator,
          onSaved: onSaved,
          initialValue: initialValue,
          builder: (field) => CheckboxListTile(
            title: title,
            value: field.value,
            // dense: field.hasError,
            onChanged: field.didChange,
            subtitle: field.hasError ? Text(field.errorText ?? '', style: TextStyle(color: Colors.red)) : null,
          ),
        );
}
