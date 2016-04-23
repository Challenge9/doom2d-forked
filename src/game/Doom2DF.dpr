{$MODE DELPHI}
program Doom2DF;
{$IFNDEF HEADLESS}
  {$IFDEF WINDOWS}
    {$APPTYPE GUI}
  {$ENDIF}
{$ENDIF}
{$HINTS OFF}

{$UNDEF XXX}
{$IFDEF USE_SDLMIXER}
 {$DEFINE XXX}
{$ENDIF}
{$IFDEF USE_FMOD}
 {$IFDEF XXX}
  {$ERROR define one of USE_SDLMIXER or USE_FMOD}
 {$ELSE}
  {$DEFINE XXX}
 {$ENDIF}
{$ENDIF}

{$IFNDEF XXX}
  {$ERROR define USE_SDLMIXER or USE_FMOD}
{$ENDIF}

uses
  conbuf in '../shared/conbuf.pas',
  GL,
  GLExt,
  SDL2 in '../lib/sdl2/sdl2.pas',
{$IFDEF USE_SDLMIXER}
  SDL2_mixer in '../lib/sdl2/SDL2_mixer.pas',
{$ENDIF}
  ENet in '../lib/enet/enet.pp',
  ENetTypes in '../lib/enet/enettypes.pp',
  ENetList in '../lib/enet/enetlist.pp',
  ENetTime in '../lib/enet/enettime.pp',
  ENetProtocol in '../lib/enet/enetprotocol.pp',
  ENetCallbacks in '../lib/enet/enetcallbacks.pp',
  ENetPlatform in '../lib/enet/enetplatform.pp',
  e_graphics in '../engine/e_graphics.pas',
  e_input in '../engine/e_input.pas',
  e_log in '../engine/e_log.pas',
  e_sound in '../engine/e_sound.pas',
  e_textures in '../engine/e_textures.pas',
  e_fixedbuffer in '../engine/e_fixedbuffer.pas',
  utils in '../shared/utils.pas',
  xstreams in '../shared/xstreams.pas',
  sfs in '../sfs/sfs.pas',
  sfsPlainFS in '../sfs/sfsPlainFS.pas',
  sfsZipFS in '../sfs/sfsZipFS.pas',
  wadreader in '../shared/wadreader.pas',
  MAPSTRUCT in '../shared/MAPSTRUCT.pas',
  MAPREADER in '../shared/MAPREADER.pas',
  MAPDEF in '../shared/MAPDEF.pas',
  CONFIG in '../shared/CONFIG.pas',
  g_basic in 'g_basic.pas',
  g_console in 'g_console.pas',
  g_net in 'g_net.pas',
  g_netmsg in 'g_netmsg.pas',
  g_nethandler in 'g_nethandler.pas',
  g_netmaster in 'g_netmaster.pas',
  g_res_downloader in 'g_res_downloader.pas',
  g_game in 'g_game.pas',
  g_gfx in 'g_gfx.pas',
  g_gui in 'g_gui.pas',
  g_items in 'g_items.pas',
  g_main in 'g_main.pas',
  g_map in 'g_map.pas',
  g_menu in 'g_menu.pas',
  g_monsters in 'g_monsters.pas',
  g_options in 'g_options.pas',
  g_phys in 'g_phys.pas',
  g_player in 'g_player.pas',
  g_playermodel in 'g_playermodel.pas',
  g_saveload in 'g_saveload.pas',
  g_sound in 'g_sound.pas',
  g_textures in 'g_textures.pas',
  g_triggers in 'g_triggers.pas',
  g_weapons in 'g_weapons.pas',
  g_window in 'g_window.pas',
  SysUtils,
{$IFDEF USE_FMOD}
  fmod in '../lib/FMOD/fmod.pas',
  fmoderrors in '../lib/FMOD/fmoderrors.pas',
  fmodpresets in '../lib/FMOD/fmodpresets.pas',
  fmodtypes in '../lib/FMOD/fmodtypes.pas',
{$ENDIF}
  BinEditor in '../shared/BinEditor.pas',
  g_panel in 'g_panel.pas',
  g_language in 'g_language.pas',
  ImagingTypes,
  Imaging,
  ImagingUtility;

{$IFDEF WINDOWS}
  {$R *.res}
  {$R CustomRes.res}
{$ENDIF}

var
  f: Integer;
  noct: Boolean = false;
begin
  for f := 1 to ParamCount do if ParamStr(f) = '--gdb' then noct := true;
  if noct then
    Main()
  else
    try
      Main();
      e_WriteLog('Shutdown with no errors.', MSG_NOTIFY);
    except
      on E: Exception do
        e_WriteLog(Format(_lc[I_SYSTEM_ERROR_MSG], [E.Message]), MSG_FATALERROR);
      else
        e_WriteLog(Format(_lc[I_SYSTEM_ERROR_UNKNOWN], [LongWord(ExceptAddr())]), MSG_FATALERROR);
    end;
end.
