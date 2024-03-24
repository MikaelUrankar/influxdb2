--- libflux/flux-core/src/lib.rs.orig	2024-03-22 19:25:12 UTC
+++ libflux/flux-core/src/lib.rs
@@ -1,4 +1,4 @@
-#![cfg_attr(feature = "strict", deny(warnings, missing_docs))]
+#![cfg_attr(feature = "strict", deny(missing_docs))]
 #![allow(
     clippy::needless_update, //
     clippy::identity_op, // Warns on `1 * YEARS` which seems clearer than `YEARS`
