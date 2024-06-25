import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthenticationView extends StatefulWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(IsAuthenticatedOrFirstTime());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, GeneralAuthenticationState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (context) {
            return [
              if (state is FirstTimeState)
                const IntroRouter(),
              if (state is UnauthenticatedState)
                SignInRoute(),
              if (state is AuthenticatedState)
                const MainNavigationRoute(),
            ];
          },
        );
      },
    );
  }
}
