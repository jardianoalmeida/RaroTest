import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';
import 'package:raro_test/app/utils/validators.dart';
import 'package:raro_test/app/widgets/button_app/button_app_widget.dart';
import 'package:raro_test/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:raro_test/app/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'package:raro_test/app/widgets/text_form_field/text_form_field_widget.dart';
import 'recover_password_controller.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState
    extends ModularState<RecoverPasswordPage, RecoverPasswordController> {
  //use 'controller' variable to access controller
  GlobalKey<FormState>? _formKey;
  TextEditingController? _usernameController;
  ReactionDisposer? disposer;

  @override
  void initState() {
    _formKey = GlobalKey();
    _usernameController = TextEditingController();
    disposer = autorun((_) {
      switch (controller.recoverPasswordResource.status) {
        case Status.loading:
          break;
        case Status.success:
          CustomAlertDialog.success(
            context,
            title: "Recuperação Enviada",
            content:
            'Enviamos as instruções para recuperação de senha para o email ${_usernameController!.text}',
          );
          _usernameController!.clear();
          break;
        case Status.failed:
          CustomAlertDialog.error(
            context,
            title: "Usuário incorreto",
            content:
            'Por favor, confira novamente se seu email está correto.',
          );
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  final spacer = const SizedBox(
    height: 25,
  );

  void _onPressed() {
    if (_formKey!.currentState!.validate()) {
      controller.recoveryPassword(_usernameController!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BackButton(),
        appBarHeight: 79,
        appBarRadius: 14,
        title: Text(
          "Esqueci minha senha",
          style: TextStyle(fontSize: 20),
        ), backgroundColor: () => Colors.red, actions: [],
      ),
      backgroundColor: AppColorScheme.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Recuperar Senha",
              textAlign: TextAlign.center,
              style: AppTextTheme.textTheme.headline6!.copyWith(fontSize: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Digite seu usuário cadastrado para a recuperação por e-mail.",
                  textAlign: TextAlign.center,
                  style: AppTextTheme.textTheme.subtitle1!.copyWith(color: AppColorScheme.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 70,
                ),
                Text("E-mail"),
                Form(
                  key: _formKey,
                  child: TextFormFieldWidget(
                    controller: _usernameController,
                    titleLabel: "Digite aqui seu e-mail",
                    borderColor: Colors.red,
                    borderError: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: AppColorScheme.grey,
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: AppColorScheme.grey,
                        width: 1.0,
                      ),
                    ),
                    validator: (String? value) => Validators.string(
                      value: value!,
                      message: "O campo não pode ser vazio",
                    ).toString(),
                    onChanged: (String value) {  },
                  ),
                ),
                spacer,
                Observer(builder: (_) {
                  return ButtonAppWidget(
                    color: AppColorScheme.primarySwatch,
                    colorContent: AppColorScheme.black,
                    text: "Recuperar",
                    onPressed: () {
                      _onPressed();
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
