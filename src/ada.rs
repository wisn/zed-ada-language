use zed_extension_api::{self as zed, Result};

struct AdaExtension;

impl zed::Extension for AdaExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let path = worktree.which("ada_language_server").ok_or_else(|| {
            "please install als manually and make sure it is available in the PATH variable"
                .to_string()
        })?;
        Ok(zed::Command {
            command: path,
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(AdaExtension);
