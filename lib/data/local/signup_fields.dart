import 'package:flutter/cupertino.dart';

import '../../naro_exporter.dart';

final signUpFormFields = [
  AppFormField(
    label: 'First Name',
    hint: 'Enter first name',
    prefixIcon: CupertinoIcons.person_fill,
    stateProvider: firstNameProvider,
    autofillHints: const [AutofillHints.name],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Last Name',
    hint: 'Enter last name',
    prefixIcon: CupertinoIcons.person_fill,
    stateProvider: lastNameProvider,
    autofillHints: const [AutofillHints.name],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Username',
    hint: 'Enter username  e.g cephas',
    prefixIcon: CupertinoIcons.at_circle_fill,
    stateProvider: userNameProvider,
    keyboardType: TextInputType.name,
    autofillHints: const [AutofillHints.username],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Gender',
    hint: 'Enter gender',
    stateProvider: genderProvider,
    dropDownItems: [
      selectGender,
      "Male",
      "Female",
    ],
    fieldType: FieldType.dropdown,
    hasFullRadius: true,
    isGenderDropDown: false,
  ),
  AppFormField(
    label: 'Date of Birth',
    hint: 'Select date of birth',
    stateProvider: dateOfBirthProvider,
    fieldType: FieldType.date,
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'National ID',
    hint: 'Enter national ID',
    maxLength: 14,
    prefixIcon: CupertinoIcons.creditcard_fill,
    stateProvider: nationalIdProvider,
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Email',
    hint: 'Enter email',
    stateProvider: emailProvider,
    keyboardType: TextInputType.emailAddress,
    prefixIcon: CupertinoIcons.mail,
    autofillHints: const [AutofillHints.email],
    validatorRegex: RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Phone Number',
    hint: 'Enter phone number',
    stateProvider: phoneNumberProvider,
    prefixIcon: CupertinoIcons.phone_fill,
    maxLength: 12,
    keyboardType: TextInputType.phone,
    autofillHints: const [
      AutofillHints.telephoneNumber,
      AutofillHints.telephoneNumberLocal,
      AutofillHints.telephoneNumberNational,
    ],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Region',
    hint: 'Enter region',
    stateProvider: regionProvider,
    prefixIcon: CupertinoIcons.app_fill,
    autofillHints: const [
      AutofillHints.addressCity,
      AutofillHints.addressState,
      AutofillHints.location,
    ],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'District',
    hint: 'Enter district',
    stateProvider: districtProvider,
    keyboardType: TextInputType.name,
    prefixIcon: CupertinoIcons.app_badge_fill,
    autofillHints: const [
      AutofillHints.location,
      AutofillHints.addressCity,
      AutofillHints.addressState,
    ],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'County',
    hint: 'Enter county',
    stateProvider: countyProvider,
    prefixIcon: CupertinoIcons.app_badge,
    autofillHints: const [
      AutofillHints.location,
      AutofillHints.addressCity,
      AutofillHints.addressState,
    ],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Sub-County',
    hint: 'Enter sub-county',
    stateProvider: subCountyProvider,
    prefixIcon: CupertinoIcons.app,
    autofillHints: const [
      AutofillHints.location,
      AutofillHints.addressCity,
      AutofillHints.addressState,
    ],
    hasFullRadius: true,
  ),
  AppFormField(
    label: 'Village',
    hint: 'Enter village',
    prefixIcon: CupertinoIcons.location_fill,
    stateProvider: villageProvider,
    autofillHints: const [
      AutofillHints.location,
      AutofillHints.addressCity,
      AutofillHints.addressState,
    ],
    hasFullRadius: true,
  ),
];
