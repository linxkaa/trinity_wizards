import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trinity_wizards/application/main_contact_cubit/main_contact_cubit.dart';
import 'package:trinity_wizards/core/commons/colors_const.dart';
import 'package:trinity_wizards/core/routes/app_router.gr.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';
import 'package:trinity_wizards/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<MainContactCubit>().getAllContact();
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Contacts'),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    context.read<MainContactCubit>().toggleSearch();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: ColorConstant.primary,
                  )),
              actions: [
                IconButton(
                    onPressed: () {
                      AutoRouter.of(context).push(EditContactRoute());
                    },
                    icon: const Icon(
                      Icons.add,
                      color: ColorConstant.primary,
                    )),
              ],
            ),
            body: BlocBuilder<MainContactCubit, MainContactState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.showSearch)
                      Padding(
                        padding: UIHelper.padding(all: 20),
                        child: TextFormFieldCustom(
                          controller: context.read<MainContactCubit>().searchController,
                          validator: (_) => null,
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: UIHelper.padding(vertical: 10, horizontal: 15),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.3,
                          children: List.generate(
                              context.read<MainContactCubit>().searchController.text.isNotEmpty
                                  ? state.modelFiltered.length
                                  : state.model.length, (index) {
                            late ContactEntity data;

                            if (state.modelFiltered.isNotEmpty) {
                              data = state.modelFiltered[index];
                            } else {
                              data = state.model[index];
                            }

                            return InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(EditContactRoute(entity: data));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorConstant.lightGrey,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: UIHelper.setSp(50),
                                      height: UIHelper.setSp(50),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.primary,
                                        borderRadius: UIHelper.borderRadiusCircular(all: 50),
                                      ),
                                    ),
                                    UIHelper.verticalSpace(10),
                                    Text(
                                      '${data.firstName} ${data.lastName}',
                                      style: context.textTheme.headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
