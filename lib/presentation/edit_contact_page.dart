import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trinity_wizards/application/edit_contact_cubit/edit_contact_cubit.dart';
import 'package:trinity_wizards/application/main_contact_cubit/main_contact_cubit.dart';
import 'package:trinity_wizards/core/commons/colors_const.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';
import 'package:trinity_wizards/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/date_time_form_field.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class EditContactPage extends StatelessWidget {
  final ContactEntity? entity;
  const EditContactPage({
    super.key,
    this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditContactCubit()..initial(entity),
      child: Builder(
        builder: (context) {
          return BlocConsumer<EditContactCubit, EditContactState>(
            listener: (context, state) {
              if (state.validated) {
                AutoRouter.of(context).pop();
                if (entity != null) {
                  context.read<MainContactCubit>().updateContact(state.model);
                } else {
                  context.read<MainContactCubit>().addNewContact(state.model);
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  leadingWidth: UIHelper.setSp(70),
                  leading: IconButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    icon: Text(
                      'Cancel',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorConstant.primary,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<EditContactCubit>().submit();
                      },
                      icon: Text(
                        'Save',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorConstant.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  padding: UIHelper.padding(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: UIHelper.setSp(100),
                          height: UIHelper.setSp(100),
                          decoration: BoxDecoration(
                            color: ColorConstant.primary,
                            borderRadius: UIHelper.borderRadiusCircular(all: 50),
                          ),
                        ),
                      ),
                      Container(
                        padding: UIHelper.padding(vertical: 10, horizontal: 10),
                        margin: UIHelper.padding(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorConstant.lightGrey.withOpacity(0.2),
                            border: Border.all(
                              color: ColorConstant.lightGrey,
                            )),
                        child: Text(
                          'Main Information',
                          style: context.textTheme.headlineMedium,
                        ),
                      ),
                      Padding(
                        padding: UIHelper.padding(horizontal: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'First Name',
                                    style: context.textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextFormFieldCustom(
                                    controller: context.read<EditContactCubit>().firstNameController,
                                    validator: (_) => state.showFirstNameError,
                                    hintText: 'Please input first name..',
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Last Name',
                                    style: context.textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextFormFieldCustom(
                                    controller: context.read<EditContactCubit>().lastNameController,
                                    validator: (_) => state.showLastNameError,
                                    hintText: 'Please input last name..',
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: UIHelper.padding(vertical: 10, horizontal: 10),
                        margin: UIHelper.padding(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorConstant.lightGrey.withOpacity(0.2),
                            border: Border.all(
                              color: ColorConstant.lightGrey,
                            )),
                        child: Text(
                          'Sub Information',
                          style: context.textTheme.headlineMedium,
                        ),
                      ),
                      Padding(
                        padding: UIHelper.padding(horizontal: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Email',
                                    style: context.textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextFormFieldCustom(
                                    controller: context.read<EditContactCubit>().emailController,
                                    hintText: 'ex: youremail@gmail.com',
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'DOB',
                                    style: context.textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: DateTextFormField(
                                    dateTimeUnformatted: (val) {},
                                    controller: context.read<EditContactCubit>().dobController,
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
