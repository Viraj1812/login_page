import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _selectedUserType = 'Select Type';
  String _selectedGender = '';
  final List<String> _selectedHobbies = [];
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  final List<String> _userTypes = [
    'Select Type',
    'Admin',
    'User',
    'Super Admin'
  ];
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _hobbies = [
    'Reading',
    'Traveling',
    'Coding',
    'Cooking',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildName(),
                const SizedBox(height: 16.0),
                _buildEmail(),
                const SizedBox(height: 16.0),
                _buildMobile(),
                const SizedBox(height: 16.0),
                _buildAddress(),
                const SizedBox(height: 16.0),
                _buildUserType(),
                const SizedBox(height: 16.0),
                _buildGenderSelector(),
                const SizedBox(height: 16.0),
                _buildHobbiesSelector(),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName() => TextFormField(
        controller: _nameController,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(f2);
        },
        decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Name is required';
          }
          return null;
        },
        focusNode: f1,
      );

  Widget _buildEmail() => TextFormField(
        focusNode: f2,
        controller: _emailController,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(f3);
        },
        decoration: const InputDecoration(
            labelText: 'Email',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email is required';
          } else if (!RegExp(r"^[a-z0-9+_.-]+@[a-z0-9.-]+$").hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
      );

  Widget _buildMobile() => TextFormField(
        controller: _mobileController,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(f4);
        },
        decoration: const InputDecoration(
            labelText: 'Mobile Number',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey))),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (validateMobileNumber(value!)) {
            return null;
          } else {
            return '$value is not a valid mobile number.';
          }
        },
        focusNode: f3,
      );

  Widget _buildAddress() => TextFormField(
        controller: _addressController,
        decoration: const InputDecoration(
            labelText: 'Address',
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey))),
        maxLines: 3,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Address cannot be empty';
          } else if (value.length > 250) {
            return 'Address cannot be more than 250 characters';
          } else if (value.length < 50) {
            return 'Address cannot be less than 50 characters';
          }
          return null;
        },
        focusNode: f4,
      );

  Widget _buildUserType() => DropdownButtonFormField(
        value: _selectedUserType,
        focusNode: null,
        onChanged: (value) {
          setState(() {
            _selectedUserType = value!;
          });
        },
        validator: (value) {
          if (value == 'Select Type') {
            return 'Please select a user type';
          }
          return null;
        },
        items: _userTypes.map((type) {
          return DropdownMenuItem(
            value: type,
            child: Text(type),
          );
        }).toList(),
        decoration: const InputDecoration(
            labelText: 'User Type',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey))),
      );

  Widget _buildGenderSelector() => Row(
        children: [
          const Text('Gender:'),
          const SizedBox(width: 16.0),
          Row(
            children: _genders.map((gender) {
              return Row(
                children: [
                  Radio(
                    value: gender,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  Text(gender),
                ],
              );
            }).toList(),
          ),
        ],
      );

  Widget _buildHobbiesSelector() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Text('Hobbies:'),
            const SizedBox(width: 16.0),
            Row(
              children: _buildHobbiesCheckboxes(),
            ),
          ],
        ),
      );

  List<Widget> _buildHobbiesCheckboxes() {
    return _hobbies.map((hobby) {
      return Row(
        children: [
          Checkbox(
            value: _selectedHobbies.contains(hobby),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  _selectedHobbies.add(hobby);
                } else {
                  _selectedHobbies.remove(hobby);
                }
              });
            },
          ),
          Text(hobby),
        ],
      );
    }).toList();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String? validationResult = validateGender(_selectedGender);

      if (validationResult != null) {
        _showToast(context, validationResult);
      } else if (_selectedHobbies.length < 2) {
        _showToast(context, 'Please select more than 2 hobbies');
      } else {
        Navigator.pushNamed(context, RoutesName.homePage);
        _showToast(context, 'REGISTRATION SUCCESSFUL');
      }
    }
  }

  void _showToast(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      elevation: 20,
      showCloseIcon: true,
      closeIconColor: Colors.red,
      dismissDirection: DismissDirection.horizontal,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return 'Please select a gender';
    }
    return null; // Gender is valid
  }

  bool validateMobileNumber(String mobileNumber) {
    RegExp pattern = RegExp(r'^\d{10}$');
    return pattern.hasMatch(mobileNumber);
  }
}
