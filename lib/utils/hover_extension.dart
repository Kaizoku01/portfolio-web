import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio_web/components/elevate_on_hover.dart';

extension HoverExtension on Widget{
  static final appContainer = html.window.document.getElementById(
    'app-container',
  );

  Widget get showCursorOnHover{
    return MouseRegion(
      child: this,
      onHover: (_) => appContainer!.style.cursor = 'pointer',
      onExit: (_) => appContainer!.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover{
    return ElevateOnHover(child: this);
  }
}

