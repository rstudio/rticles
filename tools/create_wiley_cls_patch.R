# Save the patch file in tools folder
patch_file <- "tools/wiley-cls-etex-fix.patch"
# Apply the patch using processx
result <- processx::run("git", c("apply", patch_file), error_on_status = FALSE)

if (result$status == 0) {
  message("\nPatch applied successfully!")
} else {
  message("\nFailed to apply patch:")
  message(result$stderr)
  message("\nYou can manually apply it with:")
  message("  git apply ", patch_file)
}
