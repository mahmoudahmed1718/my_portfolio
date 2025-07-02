import 'dart:js_interop';

@JS('sendEmail') // اسم الدالة في emailjs_form.js
external void sendEmail(String name, String email, String message);
