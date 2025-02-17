import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/category.dart';
import 'package:bisrepetita/models/locale.dart';
import 'package:bisrepetita/pages/question.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoryObj? selectedCategory;
  bool randomCategory = false;
  bool confirmedCategory = false;

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(
            backButton: false,
            title: getAppLocalizations(context)!.categories_page_title,
            closeButton: true),
        child: Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Column(children: [
              Flexible(
                  flex: 8,
                  child: !confirmedCategory
                      ? _categoryListView()
                      : _confirmedCategoryView()),
              Flexible(
                  flex: 1,
                  child: Center(
                      child: FilledButton(
                          onPressed: confirmedCategory ||
                                  selectedCategory != null ||
                                  randomCategory
                              ? () {
                                  if (!confirmedCategory) {
                                    Provider.of<Category>(context,
                                            listen: false)
                                        .selectCategory(selectedCategory);
                                    setState(() {
                                      confirmedCategory = true;
                                    });
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QuestionPage()));
                                  }
                                }
                              : null,
                          style: Theme.of(context).filledButtonTheme.style,
                          child: Text(
                              style: TextStyle(
                                  color: confirmedCategory ||
                                          selectedCategory != null ||
                                          randomCategory
                                      ? BPColors.textColor
                                      : BPColors.buttonDangerLabel),
                              confirmedCategory ||
                                      selectedCategory != null ||
                                      randomCategory
                                  ? getAppLocalizations(context)!
                                      .categories_page_confirm_category
                                  : getAppLocalizations(context)!
                                      .categories_page_select_category))))
            ])));
  }

  Widget _categoryListView() {
    var category = context.read<Category>();
    var bpLocale = context.read<BPLocale>();
    return ListView(children: [
      for (final category in category.randomCategoryList)
        GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory =
                    selectedCategory == null || selectedCategory != category
                        ? category
                        : null;
                randomCategory = false;
              });
            },
            child: DecoratedBox(
              key: Key(category.id),
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: BPColors.dividerColor),
                ),
              ),
              child: ListTile(
                key: Key(category.id),
                tileColor: Colors.transparent,
                title: Text(
                    style: Theme.of(context).textTheme.bodySmall,
                    switch (bpLocale.getLocaleShortName()) {
                      'fr' => category.fr_label,
                      String() => category.en_label, // Default value
                    }),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  color: BPColors.textColor,
                  stringToIcon[category.icon],
                ),
                trailing: selectedCategory == category
                    ? Icon(
                        color: Colors.white,
                        Icons.check,
                      )
                    : null,
              ),
            )),
      GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = null;
              randomCategory = !randomCategory;
            });
          },
          child: DecoratedBox(
            key: Key('random'),
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,
                    color: BPColors.dividerColor),
              ),
            ),
            child: ListTile(
              key: Key('random'),
              tileColor: Colors.transparent,
              title: Text(
                  style: Theme.of(context).textTheme.bodySmall,
                  getAppLocalizations(context)!
                      .categories_page_random_category),
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                color: BPColors.textColor,
                Icons.question_mark,
              ),
              trailing: randomCategory
                  ? Icon(
                      color: BPColors.textColor,
                      Icons.check,
                    )
                  : null,
            ),
          )),
    ]);
  }

  Widget _confirmedCategoryView() {
    var bpLocale = context.read<BPLocale>();
    return Consumer<Category>(builder: (context, category, child) {
      return Center(
        child: Text(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
            getAppLocalizations(context)!.categories_page_confirmed(
                switch (bpLocale.getLocaleShortName()) {
              'fr' => category.currentCategory.fr_label,
              String() => category.currentCategory.en_label, // Default value
            })),
      );
    });
  }
}
