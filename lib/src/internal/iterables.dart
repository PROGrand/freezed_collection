/*
 * Copyright (c) 2015-2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

/// Evaluates a lazy iterable.
///
/// Known non-lazy types are returned directly instead.
Iterable<E> evaluateIterable<E>(Iterable<E> iterable) {
  if (iterable is! List && iterable is! Set) {
    iterable = iterable.toList();
  }
  return iterable;
}
