import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/project/project_function.dart';

import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:helpbuddy/widget/loading.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  ExpandableController? controller;
  TextEditingController? nameController;
  TextEditingController? projectTitleController;
  TextEditingController? departmentController;
  TextEditingController? categoryController;
  TextEditingController? serviceController;
  TextEditingController? budgetController;
  TextEditingController? deliveryController;
  TextEditingController? deliveryTimeController;

  TimeOfDay? selectedTime;
  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    nameController = TextEditingController();
    projectTitleController = TextEditingController();
    departmentController = TextEditingController();
    categoryController = TextEditingController();
    serviceController = TextEditingController();
    budgetController = TextEditingController();
    deliveryController = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserState state = Provider.of<UserState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Create New Admin',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Balance'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [Text('Account Balance'), Text('50')],
                    )
                  ],
                ),
              ),
              cardDetails('Name', Icons.person_outline, nameController!),
              const SizedBox(
                height: 10,
              ),
              cardDetails('Title of project ', Icons.edit_document,
                  projectTitleController!),
              const SizedBox(
                height: 10,
              ),
              cardDetails('Department ', MdiIcons.accountGroupOutline,
                  departmentController!),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Category',
                      textAlign: TextAlign.left,
                      style: ConstantTheme().defaultStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              cardDetails2('Category', categoryController!, () {}),
              const SizedBox(
                height: 30,
              ),
              cardDetails2('Budget', budgetController!, () {}),
              const SizedBox(
                height: 30,
              ),
              cardDetails2('Service Type', serviceController!, () {}),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Delivery Time',
                      textAlign: TextAlign.left,
                      style: ConstantTheme().defaultStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child:
                        cardDetails2('Delivery Date', deliveryController!, () {
                      _showDateTimePicker(context);
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                text: 'Continue',
                onTap: () {
                  UserState userState =
                      Provider.of<UserState>(context, listen: false);
                  Loading().showLoadingDialog(context);

                  Map<String, Object?> data = {
                    'name': nameController!.text,
                    'projectTitle': projectTitleController!.text,
                    'department': departmentController!.text,
                    'category': categoryController!.text,
                    'serviceType': serviceController!.text,
                    'deliveryTime': 'hbhbh',
                    'taken': false,
                    'projectOwnerId': userState.userDetails!.userId,
                    'uploadedAt': DateTime.now(),
                    'adminId': '',
                    'budget': budgetController!.text,
                    'deliveryTime': deliveryController!.text,
                  };

                  ProjectFunctions().createPost(data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        deliveryController!.text = picked.toString();
      });
    }

    return picked;
  }

  void _showDateTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            initialDateTime: _selectedDateTime,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _selectedDateTime = newDateTime;
                deliveryController!.text = _selectedDateTime.toString();
              });
            },
            use24hFormat: true,
            minimumYear: 2022,
            maximumYear: 2025,
            minuteInterval: 1,
            mode: CupertinoDatePickerMode.dateAndTime,
          ),
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        deliveryTimeController!.text = selectedTime.toString();
        // _hour = selectedTime.hour.toString();
        // _minute = selectedTime.minute.toString();
        // _time = _hour + ' : ' + _minute;
        // _timeController.text = _time;
        // _timeController.text = formatDate(
        //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        //     [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  Widget cardDetails(
      String first, IconData icon, TextEditingController controller) {
    return ExpansionTile(
      textColor: Colors.grey,
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(first)
        ],
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlackOutlineInput(
            controller: controller,
          ),
        )
      ],
    );
  }

  Widget cardDetails2(
      String first, TextEditingController controller, VoidCallback ontap) {
    return InkWell(
      onTap: () {
        ontap;
      },
      child: ExpansionTile(
        textColor: Colors.grey,
        title: Row(
          children: [Text(first)],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlackOutlineInput(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
