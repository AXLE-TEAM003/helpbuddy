// /// Authors (avour, ...)

// export 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import 'package:helpbuddy/utils/network.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import 'package:flutter/material.dart';
// import 'package:helpbuddy/utils/tools.dart' as tools;

// //import 'package:requestate/shimmer/shimmer.dart';


// class ErrorDisplay extends StatelessWidget {

//   const ErrorDisplay({Key? key, 
//     this.onRefresh,
//     this.dense = false,
//     this.title = 'Oops!, a network error occured.',
//     this.actionText,
//     this.icon,
//   }) : super(key: key);
//   final VoidCallback? onRefresh;
//   final String title;
//   final IconData? icon;
//   final bool dense;
//   final String? actionText;

//   @override
//   Widget build(BuildContext context) {
//     if (dense) {
//       return ListTile(
//         leading: Icon(icon ?? Icons.error),
//         title: Text(title),
//         subtitle: Text(title),
//         trailing: (onRefresh != null)
//             ? IconButton(
//                 icon: const Icon(MdiIcons.refresh),
//                 onPressed: onRefresh,
//               )
//             : null,
//       );
//     }
//     return Center(
//         child: Column(children: [
//       const SizedBox(height: 10),
//       Icon(icon ?? MdiIcons.emoticonSad, color: Colors.orangeAccent, size: 80),
//       Text(title),
//       const SizedBox(height: 10),
//       (onRefresh != null)
//           ? TextButton(
//               onPressed: onRefresh,
//               child: Text(actionText ?? 'Refresh'),
//             )
//           : Container(),
//     ]));
//   }
// }

// // class PasswordField extends StatefulWidget {
// //   const PasswordField(
// //       {required this.fieldKey,
// //       required this.hintText,
// //       required this.labelText,
// //       required this.helperText,
// //       required this.style,
// //       required this.labelStyle,
// //       required this.onSaved,
// //       required this.validator,
// //       required this.onFieldSubmitted,
// //       required this.borderDecoration,
// //       required this.errorborderDecoration,
// //       required this.focusedborderDecoration,
// //       required this.onChanged,
// //       required this.errorText,
// //       required this.prefixIcon,
// //       required this.controller,
// //       required this.focusNode});

// //   final Key fieldKey;
// //   final String hintText;
// //   final String labelText;
// //   final String helperText;
// //   final String errorText;
// //   final TextStyle style;
// //   final TextStyle labelStyle;
// //   final FocusNode focusNode;
// //   final TextEditingController controller;
// //   final FormFieldSetter<String> onSaved;
// //   final FormFieldValidator<String> validator;
// //   final ValueChanged<String> onFieldSubmitted;
// //   final InputBorder borderDecoration;
// //   final InputBorder errorborderDecoration;
// //   final InputBorder focusedborderDecoration;
// //   final ValueChanged<String> onChanged;
// //   final Icon prefixIcon;

// //   @override
// //   _PasswordFieldState createState() => new _PasswordFieldState();
// // }

// // class _PasswordFieldState extends State<PasswordField> {
// //   bool _obscureText = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return new TextFormField(
// //       key: widget.fieldKey,
// //       // autovalidate: true,
// //       enabled: true,
// //       focusNode: widget.focusNode,
// //       obscureText: _obscureText,
// //       onSaved: widget.onSaved,
// //       validator: widget.validator,
// //       onFieldSubmitted: widget.onFieldSubmitted,
// //       onChanged: widget.onChanged,
// //       controller: widget.controller,
// //       style: widget.style,
// //       decoration: new InputDecoration(
// //         border: widget.borderDecoration,
// //         errorBorder: widget.errorborderDecoration,
// //         focusedErrorBorder: widget.errorborderDecoration,
// //         focusedBorder: widget.focusedborderDecoration,
// //         hintText: widget.hintText,
// //         labelText: widget.labelText,
// //         labelStyle: widget.labelStyle,
// //         helperText: widget.helperText,
// //         errorText: widget.errorText,
// //         suffixIcon: new GestureDetector(
// //           onTap: () {
// //             setState(() {
// //               _obscureText = !_obscureText;
// //             });
// //           },
// //           child:
// //               new Icon(_obscureText ? MdiIcons.eye : MdiIcons.eyeOff, size: 16),
// //         ),
// //       ),
// //     );
// //   }
// // }

// typedef RequestBuilder = Widget Function(
//     BuildContext context, NetworkResponse data);
// typedef RequestFuture = Future<NetworkResponse> Function();

// class RequestWidget extends StatefulWidget {

//   const RequestWidget(
//       {Key? key, required this.request,
//       required this.onSuccess,
//       this.onFailure,
//       this.onError,
//       required this.allowDragReloading,
//       this.getRequest,
//       this.onLoading,
//       this.usingCache = false,
//       this.externalControl = false,
//       this.refreshKey})
//       : super(key: key);
//   final Future<NetworkResponse?>? request;
//   final RequestFuture? getRequest;
//   final RequestBuilder onSuccess;
//   final RequestBuilder? onError;
//   final RequestBuilder? onFailure;
//   final WidgetBuilder? onLoading;
//   final bool allowDragReloading;
//   final bool externalControl;
//   final GlobalKey<RefreshIndicatorState>? refreshKey;
//   final bool usingCache;

//   @override
//   RequestWidgetState createState() => RequestWidgetState();
// }

// class RequestWidgetState extends State<RequestWidget> {
//   Future<NetworkResponse?>? _future;
//   bool _isReloading = false;

//   @override
//   void initState() {
//     super.initState();
//     _future = widget.request;
//     if (widget.usingCache) {
//       Future<NetworkResponse> request = widget.getRequest!();
//       request.then((NetworkResponse value) {
//         if (value.status == NetworkStatus.success) {
//           setState(() {
//             _future = request;
//           });
//         }
//       });
//     }
//   }

//   @override
//   void didUpdateWidget(RequestWidget e) {
//     super.didUpdateWidget(e);
//     setState(() {
//       _future = widget.request;
//     });
//   }

//   Future<NetworkResponse?> _getFuture() async {
//     NetworkResponse? response = await widget.getRequest!();
//     _isReloading = false;
//     return response;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.allowDragReloading) {
//       return RefreshIndicator(
//         key: widget.refreshKey,
//         onRefresh: () {
//           setState(() {
//             _isReloading = true;
//             _future = _getFuture();
//           });
//           return _future!.then((NetworkResponse? value) => value!);
//         },
//         child: _buildFutureWidget(),
//       );
//     }
//     return _buildFutureWidget();
//   }

//   Widget _buildFutureWidget() {
//     return FutureBuilder(
//       future: (widget.externalControl) ? widget.request : _future,
//       builder:
//           (BuildContext context, AsyncSnapshot<NetworkResponse?> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return _buildProgressIndicator();
//           // return !_isReloading
//           // ? Center(child: _buildProgressIndicator())
//           // : Container();

//           default:
//             NetworkResponse? response = snapshot.data;
//             if (snapshot.hasData) {
//               if (response!.status == NetworkStatus.success) {
//                 return widget.onSuccess(context, response);
//               } else if (response.status == NetworkStatus.failure) {
//                 return _buildFailure(response);
//               } else {
//                 return _buildError(response);
//               }
//             } else {
//               return _buildError(response);
//             }
//         }
//       },
//     );
//   }

//   Widget _buildProgressIndicator() {
//     // return AntInlineLoader();
//     if (widget.onLoading == null) {
//       return const Center(child: CircularProgressIndicator(strokeWidth: 2));
//     }
//     return widget.onLoading!(context);
//   }

//   Widget _buildError(response) {
//     if (widget.onError == null) {
//       return _defaultErrorWidget();
//     } else {
//       return widget.onError!(context, response);
//     }
//   }

//   Widget _buildFailure(response) {
//     if (widget.onFailure == null) {
//       return _defaultErrorWidget();
//     } else {
//       return widget.onFailure!(context, response);
//     }
//   }

//   Widget _defaultErrorWidget() {
//     return ErrorDisplay(
//       onRefresh: () {
//         setState(() {
//           _future = _getFuture();
//         });
//       },
//     );
//   }
// }

// class RequestButton extends StatefulWidget {
//   const RequestButton(
//       {Key? key, required this.child, required this.getFuture, this.getProgressIndicator})
//       : super(key: key);
//   final Widget child;
//   final RequestFuture getFuture;
//   final WidgetBuilder? getProgressIndicator;

//   @override
//   _RequestButtonState createState() => _RequestButtonState();
// }

// class _RequestButtonState extends State<RequestButton> {
//   late bool _isLoading;

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Stack(
//         children: <Widget>[
//           GestureDetector(
//             onTap: () => null,
//             child: widget.child,
//           ),
//           _buildProgressIndicator()
//         ],
//       );
//     }
//     return Stack(
//       children: <Widget>[
//         GestureDetector(
//           onTap: _onTap,
//           child: widget.child,
//         )
//       ],
//     );
//   }

//   Widget _buildProgressIndicator() {
//     if (widget.getProgressIndicator == null) {
//       return const CircularProgressIndicator(
//         strokeWidth: 2.5,
//       );
//     }
//     return widget.getProgressIndicator!(context);
//   }

//   _onTap() async {
//     setState(() {
//       _isLoading = true;
//     });
//     await widget.getFuture();
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }

// class EmptyPageWidget extends StatelessWidget {
//   const EmptyPageWidget(
//       {Key? key,
//       required this.title,
//       this.subtitle,
//       this.actionText,
//       this.action})
//       : super(key: key);
//   final String title;
//   final String? subtitle;
//   final String? actionText;
//   final VoidCallback? action;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
// //color: headerTextColor
//                   )),
//           const SizedBox(height: 10),
//           Text(subtitle ?? '',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodySmall!
//               //.copyWith(color: bodyTextColor.withOpacity(0.8)),
//               ),
//           const SizedBox(height: 20),
//           if (actionText != null)
//             TextButton(
//                 onPressed: action,
//                 child:
//                     Text(actionText!, style: Theme.of(context).textTheme.labelLarge!
//                         // .copyWith(color: primaryColor),
//                         ))
//         ],
//       ),
//     );
//   }
// }

// typedef EditedCallback = Future<String?> Function(String value);

// class EditableListTile extends StatefulWidget {

//   const EditableListTile({Key? key, 
//     this.onSubmitted,
//     this.onTap,
//     this.title,
//     this.subtitle,
//     this.leading,
//     this.readOnly = false,
//     this.keyboardType,
//     this.initialValue = '',
//     this.validator,
//   }) : super(key: key);
//   final EditedCallback? onSubmitted;
//   final GestureTapCallback? onTap;
//   final Widget? title;
//   final Widget? subtitle;
//   final Widget? leading;
//   final bool readOnly;
//   final TextInputType? keyboardType;
//   final String initialValue;
//   final FormFieldValidator<String>? validator;

//   @override
//   _EditableListTileState createState() => _EditableListTileState();
// }

// class _EditableListTileState extends State<EditableListTile> {
//   bool _isEditing = false;
//   bool _isLoading = false;
//   Widget? _subtitle;

//   @override
//   void initState() {
//     super.initState();
//     _subtitle = widget.subtitle;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: widget.leading,
//       onTap: null,
//       title: widget.title,
//       subtitle: !_isEditing ? _subtitle : _buildInput(),
//       trailing: _isLoading ? const CircularProgressIndicator() : _buildIcon(),
//     );
//   }

//   Widget _buildInput() {
//     return TextFormField(
//       initialValue: widget.initialValue,
//       keyboardType: widget.keyboardType,
//       readOnly: widget.readOnly,
//       onTap: widget.onTap,
//       validator: widget.validator,
//       autovalidateMode: AutovalidateMode.always,
//       autofocus: true,
//       onFieldSubmitted: (String value) async {
//         debugPrint('sdsdsd');
//         setState(() {
//           _isLoading = true;
//         });
//         String? updatedValue = await widget.onSubmitted!(value);
//         if (updatedValue != null) {
//           // if the value was successfuly updated
//           setState(() {
//             _subtitle = Text(updatedValue);
//           });
//         }
//         setState(() {
//           _isLoading = false;
//           _isEditing = false;
//         });
//       },
//     );
//   }

//   Widget _buildIcon() {
//     return IconButton(
//       icon: Icon(_isEditing ? Icons.cancel : Icons.edit),
//       onPressed: () {
//         setState(() => _isEditing = !_isEditing);
//       },
//     );
//   }
// }

// class EditablePhoneNoTile extends StatefulWidget {

//   const EditablePhoneNoTile({Key? key, 
//     this.onSubmitted,
//     this.title,
//     this.subtitle,
//     this.leading,
//     this.initialValue = '',
//   }) : super(key: key);
//   final EditedCallback? onSubmitted;
//   final Widget? title;
//   final Widget? subtitle;
//   final Widget? leading;
//   final String initialValue;

//   @override
//   _EditablePhoneNoTileState createState() => _EditablePhoneNoTileState();
// }

// class _EditablePhoneNoTileState extends State<EditablePhoneNoTile> {
//   bool _isEditing = false;
//   bool _isLoading = false;
//   Widget? _subtitle;
//   String _value = '';
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _subtitle = widget.subtitle;
//     _value = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: widget.leading,
//       title: widget.title,
//       subtitle: !_isEditing ? _subtitle : _buildInput(),
//       trailing: _isLoading ? const CircularProgressIndicator() : _buildIcon(),
//     );
//   }

//   Widget _buildInput() {
//     return Form(
//       key: _formKey,
//       child: PhoneNumberField(
//         initialNumber: widget.initialValue,
//         onFieldSubmitted: _proceed,
//         onChange: (String value) {
//           _value = value;
//         },
//       ),
//     );
//   }

//   Widget _buildIcon() {
//     return IconButton(
//       icon: Icon(_isEditing ? Icons.check : Icons.edit),
//       onPressed: () {
//         if (_isEditing) {
//           _proceed(_value);
//         }
//         setState(() => _isEditing = !_isEditing);
//       },
//     );
//   }

//   Future<void> _proceed(value) async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _isLoading = true;
//     });
//     String? updatedValue = await widget.onSubmitted!(value);
//     if (updatedValue != null) {
//       // if the value was successfuly updated
//       setState(() {
//         _subtitle = Text(updatedValue);
//       });
//     }
//     setState(() {
//       _isLoading = false;
//       _isEditing = false;
//     });
//   }
// }

// class PhoneNumberField extends StatelessWidget {
//   const PhoneNumberField({Key? key, 
//     this.initialNumber,
//     this.onFieldSubmitted,
//     this.onChange,
//     this.validator,
//   }) : super(key: key);
//   final String? initialNumber;
//   final ValueChanged<String>? onChange;
//   final ValueChanged<String>? onFieldSubmitted;
//   final FormFieldValidator<String>? validator;
//   @override
//   Widget build(BuildContext context) {
//     // return kIsWeb
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       initialValue: initialNumber,
//       onChanged: onChange,
//       validator: tools.Validators.validateMobile,
//       onFieldSubmitted: onFieldSubmitted,
//       decoration: const InputDecoration(
//         labelText: 'Phone Number',
//         prefix: Text('+234 '),
//       ),
//     );
//     // : InternationalPhoneInput(
//     //     onPhoneNumberChange:
//     //         (phoneNumber, internationalizedPhoneNumber, isoCode) {
//     //       onChange(phoneNumber);
//     //     },
//     //     initialPhoneNumber: initialNumber,
//     //     initialSelection: '+234',
//     //     enabledCountries: [
//     //       '+234',
//     //     ],
//     //   );
//   }
// }
