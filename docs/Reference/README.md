# Complete MiliUI API reference

**Version:** generated from the LuaLS declaration library shipped with the current MiliUI release.

This reference contains every declared top-level `UI.*` function, namespace/instance method, component props field, type alias and return/callback signature. Its content is generated, not manually abridged; documentation changes when the declarations change.

> **Scope:** LuaLS type declarations are the source of truth for signatures and descriptions. Shared/inherited props live on their parent classes. Some declaration files contain internal helper types for editor accuracy: **do not assume every listed helper is a supported public API**. Begin with `UI.*` and documented public namespaces. Miliastra-native API is outside MiliUI and is not included here.

**Getting started:** [Installation](../Installation.md) · [Quick Start](../../QUICK_START.md) · [API at a glance](../APIAtAGlance.md) · [Components guide](../Components.md) · [Migration to beta.3](../UpgradeBeta3.md)

**Coverage:** 30 declaration files · **71 top-level `UI.*` functions** · 645 total callable signatures · 213 classes · 1958 typed fields · 30 aliases.

## Find a reference chapter

| Declaration area | Classes | Fields | Aliases | Callable signatures |
| --- | ---: | ---: | ---: | ---: |
| [Aliases](aliases.md) | 9 | 109 | 16 | 0 |
| [Api](api.md) | 1 | 19 | 0 | 71 |
| [Components Advanced](components_advanced.md) | 11 | 213 | 0 | 39 |
| [Components Anchored Overlay](components_anchored_overlay.md) | 5 | 54 | 2 | 15 |
| [Components Base](components_base.md) | 19 | 231 | 0 | 27 |
| [Components Data Views](components_data_views.md) | 8 | 67 | 4 | 34 |
| [Components Dropdown](components_dropdown.md) | 8 | 151 | 1 | 24 |
| [Components Feedback](components_feedback.md) | 9 | 106 | 0 | 17 |
| [Components Native](components_native.md) | 10 | 44 | 0 | 39 |
| [Components Playing Card](components_playing_card.md) | 8 | 120 | 1 | 17 |
| [Components Screen](components_screen.md) | 4 | 37 | 0 | 13 |
| [Components Scroll Area](components_scroll_area.md) | 2 | 50 | 0 | 20 |
| [Components Scrollbar](components_scrollbar.md) | 2 | 42 | 0 | 11 |
| [Components Selection](components_selection.md) | 11 | 145 | 1 | 21 |
| [Helpers](helpers.md) | 40 | 180 | 2 | 100 |
| [Hosts](hosts.md) | 1 | 0 | 0 | 8 |
| [Intrinsic](intrinsic.md) | 2 | 14 | 0 | 11 |
| [Localization](localization.md) | 1 | 0 | 0 | 9 |
| [Native](native.md) | 12 | 68 | 1 | 59 |
| [Navigation](navigation.md) | 2 | 2 | 0 | 7 |
| [Pages](pages.md) | 4 | 6 | 0 | 29 |
| [Player](player.md) | 1 | 0 | 0 | 5 |
| [Responsive](responsive.md) | 10 | 65 | 1 | 24 |
| [Responsive Props](responsive_props.md) | 2 | 9 | 1 | 0 |
| [Session](session.md) | 3 | 0 | 0 | 25 |
| [Signals](signals.md) | 2 | 0 | 0 | 3 |
| [Stack Extensions](stack_extensions.md) | 5 | 23 | 0 | 6 |
| [Text Metrics](text_metrics.md) | 5 | 26 | 0 | 7 |
| [Theme](theme.md) | 14 | 176 | 0 | 2 |
| [Variables](variables.md) | 2 | 1 | 0 | 2 |

## Every top-level `UI.*` function

Entries link to their complete signatures, parameters and return types.

- [`UI.Accordion`](api.md#uiaccordionparent-props)
- [`UI.After`](api.md#uiafterseconds-callback)
- [`UI.Alert`](api.md#uialertparent-props)
- [`UI.Animation`](api.md#uianimationparent-props)
- [`UI.Badge`](api.md#uibadgeparent-props)
- [`UI.Bind`](api.md#uibindcontrol-callbacks)
- [`UI.BindKeys`](api.md#uibindkeyscontrol-eventtypes-callback)
- [`UI.Box`](api.md#uiboxparent-props)
- [`UI.Button`](api.md#uibuttonparent-props)
- [`UI.Caption`](api.md#uicaptionparent-props)
- [`UI.Card`](api.md#uicardparent-props)
- [`UI.Center`](api.md#uicentervalue)
- [`UI.Checkbox`](api.md#uicheckboxparent-props)
- [`UI.CheckLayout`](api.md#uichecklayoutroot-options)
- [`UI.CheckTextGeometry`](api.md#uichecktextgeometryroot-options)
- [`UI.Chip`](api.md#uichipparent-props)
- [`UI.Column`](api.md#uicolumnparent-props)
- [`UI.Destroy`](api.md#uidestroyvalue)
- [`UI.DestroyAll`](api.md#uidestroyall)
- [`UI.Divider`](api.md#uidividerparent-props)
- [`UI.Dropdown`](api.md#uidropdownparent-props)
- [`UI.Fan`](api.md#uifanchildren-options)
- [`UI.FullscreenAnimation`](api.md#uifullscreenanimationparent-props)
- [`UI.Grid`](api.md#uigridchildren-options)
- [`UI.GridScroller`](api.md#uigridscrollerparent-props)
- [`UI.Heading`](api.md#uiheadingparent-props)
- [`UI.Hitbox`](api.md#uihitboxparent-props)
- [`UI.Hover`](api.md#uihovercontrol-options)
- [`UI.HStack`](api.md#uihstackchildren-options)
- [`UI.Icon`](api.md#uiiconparent-props)
- [`UI.IconButton`](api.md#uiiconbuttonparent-props)
- [`UI.Image`](api.md#uiimageparent-props)
- [`UI.Init`](api.md#uiinitroot-templates)
- [`UI.InitTemplates`](api.md#uiinittemplatestemplates)
- [`UI.KeyHint`](api.md#uikeyhintparent-props)
- [`UI.Label`](api.md#uilabelparent-props)
- [`UI.ListView`](api.md#uilistviewparent-props)
- [`UI.Modal`](api.md#uimodalparent-props)
- [`UI.Native`](api.md#uinativeparent-templateindex-props)
- [`UI.Panel`](api.md#uipanelparent-props)
- [`UI.PlayingCard`](api.md#uiplayingcardparent-props)
- [`UI.Popover`](api.md#uipopoverparent-props)
- [`UI.ProgressBar`](api.md#uiprogressbarparent-props)
- [`UI.RefreshLocalization`](api.md#uirefreshlocalization)
- [`UI.Repeater`](api.md#uirepeaterparent-props)
- [`UI.ResolveText`](api.md#uiresolvetextspec)
- [`UI.Responsive`](api.md#uiresponsiveparent-props)
- [`UI.Row`](api.md#uirowparent-props)
- [`UI.SafeTextHeight`](api.md#uisafetextheightfontsize)
- [`UI.SafeTextWindowHeight`](api.md#uisafetextwindowheightfontsize)
- [`UI.Screen`](api.md#uiscreenparent-props)
- [`UI.ScrollArea`](api.md#uiscrollareaparent-props)
- [`UI.Scrollbar`](api.md#uiscrollbarparent-props)
- [`UI.ScrollColumn`](api.md#uiscrollcolumnparent-props)
- [`UI.ScrollText`](api.md#uiscrolltextparent-props)
- [`UI.Selection`](api.md#uiselectionparent-props)
- [`UI.SetText`](api.md#uisettextcontrol-spec)
- [`UI.Shell`](api.md#uishellparent-props)
- [`UI.Slider`](api.md#uisliderparent-props)
- [`UI.Spacer`](api.md#uispacerparent-props)
- [`UI.Stat`](api.md#uistatparent-props)
- [`UI.Stepper`](api.md#uistepperparent-props)
- [`UI.SurfaceControl`](api.md#uisurfacecontrolparent-props)
- [`UI.Tabs`](api.md#uitabsparent-props)
- [`UI.Text`](api.md#uitextparent-props)
- [`UI.TextWindow`](api.md#uitextwindowparent-props)
- [`UI.ToastManager`](api.md#uitoastmanagerparent-props)
- [`UI.Toggle`](api.md#uitoggleparent-props)
- [`UI.Tooltip`](api.md#uitooltipparent-props)
- [`UI.Tween`](api.md#uitweentarget-properties-duration-ease)
- [`UI.VStack`](api.md#uivstackchildren-options)

## All namespace and object methods

This includes public namespace methods and declared instance methods. Some names refer to internal support tables rather than callable `UI.*` API; check the linked chapter and practical guide.

### `Accordion`

- [`Accordion:Destroy`](components_advanced.md#accordiondestroy)
- [`Accordion:GetValue`](components_advanced.md#accordiongetvalue)
- [`Accordion:IsEnabled`](components_advanced.md#accordionisenabled)
- [`Accordion:IsOpen`](components_advanced.md#accordionisopen)
- [`Accordion:OnChange`](components_advanced.md#accordiononchangecallback)
- [`Accordion:Refresh`](components_advanced.md#accordionrefresh)
- [`Accordion:SetEnabled`](components_advanced.md#accordionsetenabledenabled)
- [`Accordion:SetOpen`](components_advanced.md#accordionsetopenopen-fireevent-animate)
- [`Accordion:SetTitle`](components_advanced.md#accordionsettitlespec)
- [`Accordion:SetValue`](components_advanced.md#accordionsetvaluevalue-fireevent-animate)
- [`Accordion:Toggle`](components_advanced.md#accordiontogglefireevent-animate)

### `Alert`

- [`Alert:Destroy`](components_feedback.md#alertdestroy)
- [`Alert:SetMessage`](components_feedback.md#alertsetmessagespec)
- [`Alert:SetTitle`](components_feedback.md#alertsettitlespec)
- [`Alert:SetVisible`](components_feedback.md#alertsetvisiblevisible)

### `Animation`

- [`Animation:Destroy`](components_native.md#animationdestroy)
- [`Animation:Play`](components_native.md#animationplay)
- [`Animation:SetAnimation`](components_native.md#animationsetanimationanimationid)
- [`Animation:SetLayer`](components_native.md#animationsetlayerlayer)
- [`Animation:SetSoundEnabled`](components_native.md#animationsetsoundenabledenabled)
- [`Animation:Stop`](components_native.md#animationstop)

### `AnimationControl`

- [`AnimationControl:PlayAnimation`](native.md#animationcontrolplayanimation)
- [`AnimationControl:StopAnimation`](native.md#animationcontrolstopanimation)

### `AudioAPI`

- [`AudioAPI.IsPlaying`](helpers.md#audioapiisplayingaudioinstanceid)
- [`AudioAPI.Play`](helpers.md#audioapiplayaudioid)
- [`AudioAPI.Stop`](helpers.md#audioapistopaudioinstanceid)

### `Badge`

- [`Badge:Destroy`](components_base.md#badgedestroy)
- [`Badge:SetLabel`](components_base.md#badgesetlabelspec)

### `Binding`

- [`Binding:Destroy`](helpers.md#bindingdestroy)

### `Button`

- [`Button:BindStates`](components_base.md#buttonbindstatestarget-states)
- [`Button:Destroy`](components_base.md#buttondestroy)
- [`Button:IsSelected`](components_base.md#buttonisselected)
- [`Button:OnClick`](components_base.md#buttononclickcallback)
- [`Button:OnDown`](components_base.md#buttonondowncallback)
- [`Button:OnEnter`](components_base.md#buttononentercallback)
- [`Button:OnExit`](components_base.md#buttononexitcallback)
- [`Button:OnUp`](components_base.md#buttononupcallback)
- [`Button:RefreshControllerFocusIndicator`](components_base.md#buttonrefreshcontrollerfocusindicator)
- [`Button:SetEnabled`](components_base.md#buttonsetenabledenabled)
- [`Button:SetLabel`](components_base.md#buttonsetlabelspec)
- [`Button:SetSelected`](components_base.md#buttonsetselectedselected)

### `ButtonControl`

- [`ButtonControl:AddCursorEventListener`](native.md#buttoncontroladdcursoreventlistenereventtype-callback)
- [`ButtonControl:RemoveAllCursorEventListeners`](native.md#buttoncontrolremoveallcursoreventlisteners)
- [`ButtonControl:RemoveCursorEventListener`](native.md#buttoncontrolremovecursoreventlistenereventtype-callback)
- [`ButtonControl:RemoveCursorEventListeners`](native.md#buttoncontrolremovecursoreventlistenerseventtype)
- [`ButtonControl:SimulateCursorClick`](native.md#buttoncontrolsimulatecursorclick)

### `Checkbox`

- [`Checkbox:Destroy`](components_advanced.md#checkboxdestroy)
- [`Checkbox:GetValue`](components_advanced.md#checkboxgetvalue)
- [`Checkbox:OnChange`](components_advanced.md#checkboxonchangecallback)
- [`Checkbox:SetCheck`](components_advanced.md#checkboxsetcheckspec)
- [`Checkbox:SetCheckIcon`](components_advanced.md#checkboxsetcheckiconimage)
- [`Checkbox:SetEnabled`](components_advanced.md#checkboxsetenabledenabled)
- [`Checkbox:SetLabel`](components_advanced.md#checkboxsetlabelspec)
- [`Checkbox:SetValue`](components_advanced.md#checkboxsetvaluevalue-fireevent)
- [`Checkbox:Toggle`](components_advanced.md#checkboxtogglefireevent)

### `Control`

- [`Control:AddKeyEventListener`](native.md#controladdkeyeventlistenereventtype-callback)
- [`Control:AddNavigationEventListener`](native.md#controladdnavigationeventlistenereventtype-callback)
- [`Control:FindChild`](native.md#controlfindchildpath)
- [`Control:GetAnchoredPosition`](native.md#controlgetanchoredposition)
- [`Control:GetAnchorMax`](native.md#controlgetanchormax)
- [`Control:GetAnchorMin`](native.md#controlgetanchormin)
- [`Control:GetChild`](native.md#controlgetchildname)
- [`Control:GetChildren`](native.md#controlgetchildren)
- [`Control:GetControllerNavigation`](native.md#controlgetcontrollernavigationdirection)
- [`Control:GetLocalRotation`](native.md#controlgetlocalrotation)
- [`Control:GetLocalScale`](native.md#controlgetlocalscale)
- [`Control:GetPivot`](native.md#controlgetpivot)
- [`Control:GetScript`](native.md#controlgetscriptscriptprefabindex)
- [`Control:GetScriptByPath`](native.md#controlgetscriptbypathscriptpath)
- [`Control:GetScripts`](native.md#controlgetscripts)
- [`Control:GetSiblingIndex`](native.md#controlgetsiblingindex)
- [`Control:GetSizeDelta`](native.md#controlgetsizedelta)
- [`Control:RemoveAllKeyEventListeners`](native.md#controlremoveallkeyeventlisteners)
- [`Control:RemoveAllNavigationEventListeners`](native.md#controlremoveallnavigationeventlisteners)
- [`Control:RemoveKeyEventListener`](native.md#controlremovekeyeventlistenereventtype-callback)
- [`Control:RemoveKeyEventListeners`](native.md#controlremovekeyeventlistenerseventtype)
- [`Control:RemoveNavigationEventListener`](native.md#controlremovenavigationeventlistenereventtype-callback)
- [`Control:RemoveNavigationEventListeners`](native.md#controlremovenavigationeventlistenerseventtype)
- [`Control:SetActive`](native.md#controlsetactiveactive)
- [`Control:SetAnchoredPosition`](native.md#controlsetanchoredpositionx-y)
- [`Control:SetAnchorMax`](native.md#controlsetanchormaxx-y)
- [`Control:SetAnchorMin`](native.md#controlsetanchorminx-y)
- [`Control:SetAsFirstSibling`](native.md#controlsetasfirstsibling)
- [`Control:SetAsLastSibling`](native.md#controlsetaslastsibling)
- [`Control:SetControllerNavigation`](native.md#controlsetcontrollernavigationdirection-mode-target)
- [`Control:SetLocalRotation`](native.md#controlsetlocalrotationx-y-z)
- [`Control:SetLocalScale`](native.md#controlsetlocalscalex-y-z)
- [`Control:SetPivot`](native.md#controlsetpivotx-y)
- [`Control:SetSiblingIndex`](native.md#controlsetsiblingindexindex)
- [`Control:SetSizeDelta`](native.md#controlsetsizedeltawidth-height)
- [`Control:SetVisible`](native.md#controlsetvisiblevisible)

### `CoreAPI`

- [`CoreAPI.After`](helpers.md#coreapiafterseconds-callback)
- [`CoreAPI.AttachHost`](helpers.md#coreapiattachhosthostid-root)
- [`CoreAPI.ConstrainDimension`](helpers.md#coreapiconstraindimensionvalue-minimum-maximum-relativeto-fallback)
- [`CoreAPI.Destroy`](helpers.md#coreapidestroycontrol)
- [`CoreAPI.DestroyAll`](helpers.md#coreapidestroyall)
- [`CoreAPI.DetachHost`](helpers.md#coreapidetachhosthostid)
- [`CoreAPI.GetCurrentHostId`](helpers.md#coreapigetcurrenthostid)
- [`CoreAPI.GetEffectiveScale`](helpers.md#coreapigeteffectivescalecontrol)
- [`CoreAPI.GetHostId`](helpers.md#coreapigethostidvalue)
- [`CoreAPI.GetHostIds`](helpers.md#coreapigethostids)
- [`CoreAPI.GetRoot`](helpers.md#coreapigetroothostid)
- [`CoreAPI.HideNativeChildren`](helpers.md#coreapihidenativechildrencontrol)
- [`CoreAPI.InitTemplates`](helpers.md#coreapiinittemplatestemplates)
- [`CoreAPI.IsHostAttached`](helpers.md#coreapiishostattachedhostid)
- [`CoreAPI.Listen`](helpers.md#coreapilistencontrol-eventtype-callback)
- [`CoreAPI.New`](helpers.md#coreapinewkind-parent-name)
- [`CoreAPI.NewTemplate`](helpers.md#coreapinewtemplatetemplateindex-parent-name)
- [`CoreAPI.Rect`](helpers.md#coreapirectcontrol-props)
- [`CoreAPI.RefreshLayout`](helpers.md#coreapirefreshlayoutparent)
- [`CoreAPI.RegisterHostDetachHook`](helpers.md#coreapiregisterhostdetachhookcallback)
- [`CoreAPI.RegisterResize`](helpers.md#coreapiregisterresizecontrol-callback)
- [`CoreAPI.ResolveControl`](helpers.md#coreapiresolvecontrolvalue)
- [`CoreAPI.ResolveDimension`](helpers.md#coreapiresolvedimensionvalue-relativeto-fallback)
- [`CoreAPI.ResolveParent`](helpers.md#coreapiresolveparentvalue)
- [`CoreAPI.ScreenDeltaToLocal`](helpers.md#coreapiscreendeltatolocalcontrol-deltax-deltay)
- [`CoreAPI.SetSize`](helpers.md#coreapisetsizecontrol-width-height)
- [`CoreAPI.TrackDisposable`](helpers.md#coreapitrackdisposablehostid-dispose)
- [`CoreAPI.Tween`](helpers.md#coreapitweentarget-values-duration-ease)
- [`CoreAPI.Unlisten`](helpers.md#coreapiunlistencontrol-eventtype-callback)
- [`CoreAPI.WithHost`](helpers.md#coreapiwithhosthostid-callback-)

### `CursorAreaControl`

- [`CursorAreaControl:AddCursorEventListener`](native.md#cursorareacontroladdcursoreventlistenereventtype-callback)
- [`CursorAreaControl:RemoveAllCursorEventListeners`](native.md#cursorareacontrolremoveallcursoreventlisteners)
- [`CursorAreaControl:RemoveCursorEventListener`](native.md#cursorareacontrolremovecursoreventlistenereventtype-callback)
- [`CursorAreaControl:RemoveCursorEventListeners`](native.md#cursorareacontrolremovecursoreventlistenerseventtype)
- [`CursorAreaControl:SimulateCursorClick`](native.md#cursorareacontrolsimulatecursorclick)

### `CursorEventData`

- [`CursorEventData:GetPressUIPos`](native.md#cursoreventdatagetpressuipos)
- [`CursorEventData:GetUIPos`](native.md#cursoreventdatagetuipos)
- [`CursorEventData:GetUIPosDelta`](native.md#cursoreventdatagetuiposdelta)

### `DiagnosticsAPI`

- [`DiagnosticsAPI.Check`](responsive.md#diagnosticsapicheckroot-options)
- [`DiagnosticsAPI.CheckText`](responsive.md#diagnosticsapichecktextroot-options)
- [`DiagnosticsAPI.SetEnabled`](responsive.md#diagnosticsapisetenabledenabled)
- [`DiagnosticsAPI.Watch`](responsive.md#diagnosticsapiwatchroot-options)

### `Dropdown`

- [`Dropdown:BuildSubmitPayload`](components_dropdown.md#dropdownbuildsubmitpayload)
- [`Dropdown:CanSubmit`](components_dropdown.md#dropdowncansubmit)
- [`Dropdown:Clear`](components_dropdown.md#dropdownclearfireevent)
- [`Dropdown:Close`](components_dropdown.md#dropdownclose)
- [`Dropdown:Destroy`](components_dropdown.md#dropdowndestroy)
- [`Dropdown:GetOpenDirection`](components_dropdown.md#dropdowngetopendirection)
- [`Dropdown:GetSelected`](components_dropdown.md#dropdowngetselected)
- [`Dropdown:GetSelectedItem`](components_dropdown.md#dropdowngetselecteditem)
- [`Dropdown:GetVisibleRange`](components_dropdown.md#dropdowngetvisiblerange)
- [`Dropdown:IsOpen`](components_dropdown.md#dropdownisopen)
- [`Dropdown:IsScrollable`](components_dropdown.md#dropdownisscrollable)
- [`Dropdown:OnChange`](components_dropdown.md#dropdownonchangecallback)
- [`Dropdown:OnClose`](components_dropdown.md#dropdownonclosecallback)
- [`Dropdown:OnOpen`](components_dropdown.md#dropdownonopencallback)
- [`Dropdown:OnSubmit`](components_dropdown.md#dropdownonsubmitcallback)
- [`Dropdown:Open`](components_dropdown.md#dropdownopen)
- [`Dropdown:ScrollBy`](components_dropdown.md#dropdownscrollbydelta)
- [`Dropdown:ScrollTo`](components_dropdown.md#dropdownscrolltoindex)
- [`Dropdown:SetEnabled`](components_dropdown.md#dropdownsetenabledenabled)
- [`Dropdown:SetItemEnabled`](components_dropdown.md#dropdownsetitemenabledindex-enabled)
- [`Dropdown:SetSelected`](components_dropdown.md#dropdownsetselectedindex-fireevent)
- [`Dropdown:SetSubmitButton`](components_dropdown.md#dropdownsetsubmitbuttonbutton)
- [`Dropdown:Submit`](components_dropdown.md#dropdownsubmit)
- [`Dropdown:Toggle`](components_dropdown.md#dropdowntoggle)

### `FullscreenAnimation`

- [`FullscreenAnimation:Destroy`](components_native.md#fullscreenanimationdestroy)
- [`FullscreenAnimation:Play`](components_native.md#fullscreenanimationplay)
- [`FullscreenAnimation:SetAnimation`](components_native.md#fullscreenanimationsetanimationanimationid)
- [`FullscreenAnimation:SetSoundEnabled`](components_native.md#fullscreenanimationsetsoundenabledenabled)
- [`FullscreenAnimation:Stop`](components_native.md#fullscreenanimationstop)

### `GridScroller`

- [`GridScroller:Destroy`](components_native.md#gridscrollerdestroy)
- [`GridScroller:GetContentLength`](components_native.md#gridscrollergetcontentlength)
- [`GridScroller:GetItemCount`](components_native.md#gridscrollergetitemcount)
- [`GridScroller:GetItemIndex`](components_native.md#gridscrollergetitemindexitemcontrol)
- [`GridScroller:GetItemPrefabIndex`](components_native.md#gridscrollergetitemprefabindex)
- [`GridScroller:GetItemSize`](components_native.md#gridscrollergetitemsize)
- [`GridScroller:GetItemSpacing`](components_native.md#gridscrollergetitemspacing)
- [`GridScroller:GetLayoutConstraint`](components_native.md#gridscrollergetlayoutconstraint)
- [`GridScroller:GetLayoutConstraintFixedCount`](components_native.md#gridscrollergetlayoutconstraintfixedcount)
- [`GridScroller:GetPadding`](components_native.md#gridscrollergetpadding)
- [`GridScroller:GetProgress`](components_native.md#gridscrollergetprogress)
- [`GridScroller:GetScrollDirection`](components_native.md#gridscrollergetscrolldirection)
- [`GridScroller:Refresh`](components_native.md#gridscrollerrefreshitemcount-callback)
- [`GridScroller:ScrollTo`](components_native.md#gridscrollerscrolltoindex-aligntype)
- [`GridScroller:SetEnabled`](components_native.md#gridscrollersetenabledenabled)
- [`GridScroller:SetItemPrefabIndex`](components_native.md#gridscrollersetitemprefabindexindex)
- [`GridScroller:SetProgress`](components_native.md#gridscrollersetprogressprogress)
- [`GridScroller:SetScrollBarVisible`](components_native.md#gridscrollersetscrollbarvisiblevisible)

### `GridScrollerControl`

- [`GridScrollerControl:GetContentLength`](native.md#gridscrollercontrolgetcontentlength)
- [`GridScrollerControl:GetItemIndex`](native.md#gridscrollercontrolgetitemindexcontrol)
- [`GridScrollerControl:GetItemSize`](native.md#gridscrollercontrolgetitemsize)
- [`GridScrollerControl:GetItemSpacing`](native.md#gridscrollercontrolgetitemspacing)
- [`GridScrollerControl:GetPadding`](native.md#gridscrollercontrolgetpadding)
- [`GridScrollerControl:RefreshItems`](native.md#gridscrollercontrolrefreshitemsitemcount-callback)
- [`GridScrollerControl:ScrollToItemAt`](native.md#gridscrollercontrolscrolltoitematindex-aligntype)

### `Hitbox`

- [`Hitbox:Bind`](helpers.md#hitboxbindcallbacks)
- [`Hitbox:CancelCurrentClick`](helpers.md#hitboxcancelcurrentclick)
- [`Hitbox:Destroy`](helpers.md#hitboxdestroy)
- [`Hitbox:OnClick`](helpers.md#hitboxonclickcallback)
- [`Hitbox:RefreshControllerFocusIndicator`](helpers.md#hitboxrefreshcontrollerfocusindicator)
- [`Hitbox:SetEnabled`](helpers.md#hitboxsetenabledenabled)

### `Hosts`

- [`Hosts.After`](hosts.md#hostsafterhostid-seconds-callback)
- [`Hosts.Attach`](hosts.md#hostsattachuiindex-hostid-root)
- [`Hosts.Detach`](hosts.md#hostsdetachhostid)
- [`Hosts.GetAttachedHosts`](hosts.md#hostsgetattachedhosts)
- [`Hosts.GetIndex`](hosts.md#hostsgetindexhostid)
- [`Hosts.GetRoot`](hosts.md#hostsgetroothostid)
- [`Hosts.IsAttached`](hosts.md#hostsisattachedhostid)
- [`Hosts.RequireIndex`](hosts.md#hostsrequireindexhostid)

### `Hover`

- [`Hover:Destroy`](helpers.md#hoverdestroy)
- [`Hover:RefreshBase`](helpers.md#hoverrefreshbase)
- [`Hover:SetEnabled`](helpers.md#hoversetenabledenabled)

### `ImageControl`

- [`ImageControl:SetImage`](native.md#imagecontrolsetimageimagesource-imageid)

### `InteractionAPI`

- [`InteractionAPI.Bind`](helpers.md#interactionapibindcontrol-callbacks)
- [`InteractionAPI.BindKeys`](helpers.md#interactionapibindkeyscontrol-eventtypes-callback)
- [`InteractionAPI.ConfigureControllerNavigation`](helpers.md#interactionapiconfigurecontrollernavigationcontrol-enabled)
- [`InteractionAPI.Hitbox`](helpers.md#interactionapihitboxparent-props)
- [`InteractionAPI.Hover`](helpers.md#interactionapihovercontrol-options)

### `IntrinsicBadge`

- [`IntrinsicBadge:GetNaturalSize`](intrinsic.md#intrinsicbadgegetnaturalsize)

### `IntrinsicButton`

- [`IntrinsicButton:GetNaturalSize`](intrinsic.md#intrinsicbuttongetnaturalsize)
- [`IntrinsicButton:SetContentPadding`](intrinsic.md#intrinsicbuttonsetcontentpaddinghorizontal-vertical)
- [`IntrinsicButton:SetIcon`](intrinsic.md#intrinsicbuttonseticonimage)

### `IntrinsicScrollArea`

- [`IntrinsicScrollArea:BindContentHeight`](intrinsic.md#intrinsicscrollareabindcontentheightsource-options)

### `IntrinsicStack`

- [`IntrinsicStack:GetNaturalSize`](intrinsic.md#intrinsicstackgetnaturalsize)
- [`IntrinsicStack:IsFittingContent`](intrinsic.md#intrinsicstackisfittingcontent)
- [`IntrinsicStack:SetFitContent`](intrinsic.md#intrinsicstacksetfitcontentwidth-height)

### `IntrinsicTextWindow`

- [`IntrinsicTextWindow:GetEstimatedLineCount`](intrinsic.md#intrinsictextwindowgetestimatedlinecount)
- [`IntrinsicTextWindow:GetNaturalHeight`](intrinsic.md#intrinsictextwindowgetnaturalheight)
- [`IntrinsicTextWindow:RefreshContentHeight`](intrinsic.md#intrinsictextwindowrefreshcontentheight)

### `KeyBinding`

- [`KeyBinding:Destroy`](helpers.md#keybindingdestroy)

### `KeyHint`

- [`KeyHint:Destroy`](components_native.md#keyhintdestroy)
- [`KeyHint:GetControllerKey`](components_native.md#keyhintgetcontrollerkey)
- [`KeyHint:GetKeyboardKey`](components_native.md#keyhintgetkeyboardkey)
- [`KeyHint:SetControllerKey`](components_native.md#keyhintsetcontrollerkeykey)
- [`KeyHint:SetKeyboardKey`](components_native.md#keyhintsetkeyboardkeykey)
- [`KeyHint:SetKeys`](components_native.md#keyhintsetkeyskeyboardkey-controllerkey)

### `LayoutAPI`

- [`LayoutAPI.Fan`](helpers.md#layoutapifanchildren-options)
- [`LayoutAPI.Grid`](helpers.md#layoutapigridchildren-options)
- [`LayoutAPI.HStack`](helpers.md#layoutapihstackchildren-options)
- [`LayoutAPI.VStack`](helpers.md#layoutapivstackchildren-options)

### `LayoutWatcher`

- [`LayoutWatcher:Check`](responsive.md#layoutwatchercheck)

### `ListView`

- [`ListView:AddItem`](components_data_views.md#listviewadditemitem-index)
- [`ListView:Clear`](components_data_views.md#listviewclear)
- [`ListView:ClearSort`](components_data_views.md#listviewclearsort)
- [`ListView:Destroy`](components_data_views.md#listviewdestroy)
- [`ListView:GetDirection`](components_data_views.md#listviewgetdirection)
- [`ListView:GetEntries`](components_data_views.md#listviewgetentries)
- [`ListView:GetEntry`](components_data_views.md#listviewgetentrykey)
- [`ListView:GetEntryAt`](components_data_views.md#listviewgetentryatindex)
- [`ListView:GetItems`](components_data_views.md#listviewgetitems)
- [`ListView:GetSort`](components_data_views.md#listviewgetsort)
- [`ListView:Refresh`](components_data_views.md#listviewrefresh)
- [`ListView:RemoveItem`](components_data_views.md#listviewremoveitemkey)
- [`ListView:Reverse`](components_data_views.md#listviewreverse)
- [`ListView:SetDirection`](components_data_views.md#listviewsetdirectiondirection)
- [`ListView:SetItems`](components_data_views.md#listviewsetitemsitems)
- [`ListView:SetSort`](components_data_views.md#listviewsetsortsort-order)
- [`ListView:SortOnce`](components_data_views.md#listviewsortoncesort-order)

### `Localization`

- [`Localization.Bind`](localization.md#localizationbindcontrol-spec-fallbacktext)
- [`Localization.Normalize`](localization.md#localizationnormalizespec-fallbacktext)
- [`Localization.Refresh`](localization.md#localizationrefreshcontrol)
- [`Localization.RefreshAll`](localization.md#localizationrefreshall)
- [`Localization.Resolve`](localization.md#localizationresolvespec-fallbacktext)
- [`Localization.Set`](localization.md#localizationsetcontrol-spec-fallbacktext)
- [`Localization.TextProps`](localization.md#localizationtextpropsspec-fallbacktext-props)
- [`Localization.Unbind`](localization.md#localizationunbindcontrol)
- [`Localization.WithArgs`](localization.md#localizationwithargsspec-args-fallbacktext)

### `Modal`

- [`Modal:Close`](components_feedback.md#modalclose)
- [`Modal:Destroy`](components_feedback.md#modaldestroy)
- [`Modal:IsOpen`](components_feedback.md#modalisopen)
- [`Modal:OnClose`](components_feedback.md#modalonclosecallback)
- [`Modal:OnOpen`](components_feedback.md#modalonopencallback)
- [`Modal:Open`](components_feedback.md#modalopen)
- [`Modal:SetCloseIcon`](components_feedback.md#modalsetcloseiconimage)
- [`Modal:SetCloseLabel`](components_feedback.md#modalsetcloselabelspec)
- [`Modal:SetTitle`](components_feedback.md#modalsettitlespec)

### `MotionAPI`

- [`MotionAPI.After`](helpers.md#motionapiafterseconds-callback)
- [`MotionAPI.BounceIn`](helpers.md#motionapibounceincontrol-options)
- [`MotionAPI.Breathe`](helpers.md#motionapibreathecontrol-options)
- [`MotionAPI.Cancel`](helpers.md#motionapicanceltarget-channels)
- [`MotionAPI.DropIn`](helpers.md#motionapidropincontrol-options)
- [`MotionAPI.FlipX`](helpers.md#motionapiflipxcontrol-options-midpointcallback)
- [`MotionAPI.Hop`](helpers.md#motionapihopcontrol-options)
- [`MotionAPI.MoveTo`](helpers.md#motionapimovetocontrol-x-y-duration-ease)
- [`MotionAPI.Nudge`](helpers.md#motionapinudgecontrol-options)
- [`MotionAPI.PopIn`](helpers.md#motionapipopincontrol-options)
- [`MotionAPI.Pulse`](helpers.md#motionapipulsecontrol-options)
- [`MotionAPI.Punch`](helpers.md#motionapipunchcontrol-options)
- [`MotionAPI.RotateTo`](helpers.md#motionapirotatetocontrol-rotation-duration-ease)
- [`MotionAPI.RubberBand`](helpers.md#motionapirubberbandcontrol-options)
- [`MotionAPI.ScaleTo`](helpers.md#motionapiscaletocontrol-scalex-scaley-duration-ease)
- [`MotionAPI.Shake`](helpers.md#motionapishakecontrol-options)
- [`MotionAPI.Slam`](helpers.md#motionapislamcontrol-options)
- [`MotionAPI.SlideIn`](helpers.md#motionapislideincontrol-options)
- [`MotionAPI.SpinIn`](helpers.md#motionapispinincontrol-options)
- [`MotionAPI.Squash`](helpers.md#motionapisquashcontrol-options)
- [`MotionAPI.Swing`](helpers.md#motionapiswingcontrol-options)
- [`MotionAPI.Tween`](helpers.md#motionapitweentarget-properties-duration-ease)
- [`MotionAPI.Wobble`](helpers.md#motionapiwobblecontrol-options)

### `Navigation`

- [`Navigation.Back`](navigation.md#navigationbackhostid-options)
- [`Navigation.CanGoBack`](navigation.md#navigationcangobackhostid)
- [`Navigation.GetCurrent`](navigation.md#navigationgetcurrenthostid)
- [`Navigation.GetHistory`](navigation.md#navigationgethistoryhostid)
- [`Navigation.Push`](navigation.md#navigationpushpageid-options)
- [`Navigation.Replace`](navigation.md#navigationreplacepageid-options)
- [`Navigation.Reset`](navigation.md#navigationresetpageid-options)

### `PageContext`

- [`PageContext:Back`](pages.md#pagecontextbackoptions)
- [`PageContext:BringToFront`](pages.md#pagecontextbringtofront)
- [`PageContext:CanGoBack`](pages.md#pagecontextcangoback)
- [`PageContext:Close`](pages.md#pagecontextclose)
- [`PageContext:Push`](pages.md#pagecontextpushpageid-options)
- [`PageContext:Replace`](pages.md#pagecontextreplacepageid-options)
- [`PageContext:Reset`](pages.md#pagecontextresetpageid-options)

### `PageHandle`

- [`PageHandle:BringToFront`](pages.md#pagehandlebringtofront)
- [`PageHandle:Close`](pages.md#pagehandleclose)
- [`PageHandle:Get`](pages.md#pagehandleget)
- [`PageHandle:IsOpen`](pages.md#pagehandleisopen)
- [`PageHandle:IsRegistered`](pages.md#pagehandleisregistered)
- [`PageHandle:Open`](pages.md#pagehandleopen)
- [`PageHandle:Register`](pages.md#pagehandleregister)
- [`PageHandle:Unregister`](pages.md#pagehandleunregister)

### `Pages`

- [`Pages.BringToFront`](pages.md#pagesbringtofrontpageid)
- [`Pages.Close`](pages.md#pagesclosepageid)
- [`Pages.CloseAll`](pages.md#pagescloseallhostid)
- [`Pages.Define`](pages.md#pagesdefinepageid-definition)
- [`Pages.Get`](pages.md#pagesgetpageid)
- [`Pages.GetActivePage`](pages.md#pagesgetactivepagehostid)
- [`Pages.GetHost`](pages.md#pagesgethostpageid)
- [`Pages.GetOpenPages`](pages.md#pagesgetopenpageshostid)
- [`Pages.IsOpen`](pages.md#pagesisopenpageid)
- [`Pages.IsRegistered`](pages.md#pagesisregisteredpageid)
- [`Pages.Open`](pages.md#pagesopenpageid)
- [`Pages.Register`](pages.md#pagesregisterpageid-definition)
- [`Pages.Restore`](pages.md#pagesrestorehostid)
- [`Pages.Unregister`](pages.md#pagesunregisterpageid)

### `Player`

- [`Player.Configure`](player.md#playerconfigurecustomvariablename)
- [`Player.GetCustomVariableName`](player.md#playergetcustomvariablename)
- [`Player.GetEntity`](player.md#playergetentity)
- [`Player.IsConfigured`](player.md#playerisconfigured)
- [`Player.RequireEntity`](player.md#playerrequireentity)

### `PlayingCard`

- [`PlayingCard:Destroy`](components_playing_card.md#playingcarddestroy)
- [`PlayingCard:Flip`](components_playing_card.md#playingcardflipface-options)
- [`PlayingCard:OnClick`](components_playing_card.md#playingcardonclickcallback)
- [`PlayingCard:SetArtwork`](components_playing_card.md#playingcardsetartworkimage)
- [`PlayingCard:SetBackFrameColor`](components_playing_card.md#playingcardsetbackframecolorcolor)
- [`PlayingCard:SetEnabled`](components_playing_card.md#playingcardsetenabledenabled)
- [`PlayingCard:SetFace`](components_playing_card.md#playingcardsetfaceface)
- [`PlayingCard:SetFrameColor`](components_playing_card.md#playingcardsetframecolorcolor)
- [`PlayingCard:SetHeaderIcon`](components_playing_card.md#playingcardsetheadericonicon)
- [`PlayingCard:SetHeaderLabel`](components_playing_card.md#playingcardsetheaderlabelspec)
- [`PlayingCard:SetSelected`](components_playing_card.md#playingcardsetselectedselected)
- [`PlayingCard:SetSubtitle`](components_playing_card.md#playingcardsetsubtitlespec)
- [`PlayingCard:SetTitle`](components_playing_card.md#playingcardsettitlespec)
- [`PlayingCard:SetValue`](components_playing_card.md#playingcardsetvaluespec)
- [`PlayingCard:SetVisible`](components_playing_card.md#playingcardsetvisiblevisible)
- [`PlayingCard:ShowBack`](components_playing_card.md#playingcardshowback)
- [`PlayingCard:ShowFront`](components_playing_card.md#playingcardshowfront)

### `Popover`

- [`Popover:Close`](components_anchored_overlay.md#popoverclose)
- [`Popover:Destroy`](components_anchored_overlay.md#popoverdestroy)
- [`Popover:IsOpen`](components_anchored_overlay.md#popoverisopen)
- [`Popover:OnClose`](components_anchored_overlay.md#popoveronclosecallback)
- [`Popover:OnOpen`](components_anchored_overlay.md#popoveronopencallback)
- [`Popover:Open`](components_anchored_overlay.md#popoveropen)
- [`Popover:RefreshPlacement`](components_anchored_overlay.md#popoverrefreshplacement)
- [`Popover:SetAnchor`](components_anchored_overlay.md#popoversetanchoranchor)
- [`Popover:Toggle`](components_anchored_overlay.md#popovertoggle)

### `ProgressBar`

- [`ProgressBar:Destroy`](components_base.md#progressbardestroy)
- [`ProgressBar:GetValue`](components_base.md#progressbargetvalue)
- [`ProgressBar:SetValue`](components_base.md#progressbarsetvaluevalue-animate)

### `Repeater`

- [`Repeater:AddItem`](components_data_views.md#repeateradditemitem-index)
- [`Repeater:Clear`](components_data_views.md#repeaterclear)
- [`Repeater:ClearSort`](components_data_views.md#repeaterclearsort)
- [`Repeater:Destroy`](components_data_views.md#repeaterdestroy)
- [`Repeater:GetDirection`](components_data_views.md#repeatergetdirection)
- [`Repeater:GetEntries`](components_data_views.md#repeatergetentries)
- [`Repeater:GetEntry`](components_data_views.md#repeatergetentrykey)
- [`Repeater:GetEntryAt`](components_data_views.md#repeatergetentryatindex)
- [`Repeater:GetItems`](components_data_views.md#repeatergetitems)
- [`Repeater:GetSort`](components_data_views.md#repeatergetsort)
- [`Repeater:Refresh`](components_data_views.md#repeaterrefresh)
- [`Repeater:RemoveItem`](components_data_views.md#repeaterremoveitemkey)
- [`Repeater:Reverse`](components_data_views.md#repeaterreverse)
- [`Repeater:SetDirection`](components_data_views.md#repeatersetdirectiondirection)
- [`Repeater:SetItems`](components_data_views.md#repeatersetitemsitems)
- [`Repeater:SetSort`](components_data_views.md#repeatersetsortsort-order)
- [`Repeater:SortOnce`](components_data_views.md#repeatersortoncesort-order)

### `ResponsiveClass`

- [`ResponsiveClass.New`](responsive.md#responsiveclassnewui-parent-props)

### `ResponsiveLayout`

- [`ResponsiveLayout:Add`](responsive.md#responsivelayoutaddvalue-options)
- [`ResponsiveLayout:Clear`](responsive.md#responsivelayoutclear)
- [`ResponsiveLayout:Destroy`](responsive.md#responsivelayoutdestroy)
- [`ResponsiveLayout:GetFocus`](responsive.md#responsivelayoutgetfocus)
- [`ResponsiveLayout:GetLayoutInfo`](responsive.md#responsivelayoutgetlayoutinfo)
- [`ResponsiveLayout:GetMode`](responsive.md#responsivelayoutgetmode)
- [`ResponsiveLayout:Next`](responsive.md#responsivelayoutnext)
- [`ResponsiveLayout:OnFocusChange`](responsive.md#responsivelayoutonfocuschangecallback)
- [`ResponsiveLayout:OnModeChange`](responsive.md#responsivelayoutonmodechangecallback)
- [`ResponsiveLayout:Previous`](responsive.md#responsivelayoutprevious)
- [`ResponsiveLayout:Refresh`](responsive.md#responsivelayoutrefresh)
- [`ResponsiveLayout:Remove`](responsive.md#responsivelayoutremovevalue)
- [`ResponsiveLayout:SetFocus`](responsive.md#responsivelayoutsetfocusindex)
- [`ResponsiveLayout:SetGap`](responsive.md#responsivelayoutsetgapgapx-gapy)
- [`ResponsiveLayout:SetInsets`](responsive.md#responsivelayoutsetinsetsleft-right-top-bottom)
- [`ResponsiveLayout:SetMaximumColumns`](responsive.md#responsivelayoutsetmaximumcolumnscolumns)
- [`ResponsiveLayout:SetMinimumCellSize`](responsive.md#responsivelayoutsetminimumcellsizewidth-height)
- [`ResponsiveLayout:SetPadding`](responsive.md#responsivelayoutsetpaddingpadding)

### `Screen`

- [`Screen:Destroy`](components_screen.md#screendestroy)
- [`Screen:GetAspectRatio`](components_screen.md#screengetaspectratio)
- [`Screen:GetContentSize`](components_screen.md#screengetcontentsize)
- [`Screen:GetOrientation`](components_screen.md#screengetorientation)
- [`Screen:GetSize`](components_screen.md#screengetsize)
- [`Screen:Matches`](components_screen.md#screenmatchesquery)
- [`Screen:OnResize`](components_screen.md#screenonresizecallback)
- [`Screen:Refresh`](components_screen.md#screenrefresh)
- [`Screen:ReleaseInput`](components_screen.md#screenreleaseinput)
- [`Screen:SetCursorVisible`](components_screen.md#screensetcursorvisiblevisible)
- [`Screen:SetInputCapture`](components_screen.md#screensetinputcaptureoptions)
- [`Screen:SetInsets`](components_screen.md#screensetinsetsleft-right-top-bottom)
- [`Screen:SetPadding`](components_screen.md#screensetpaddingpadding)

### `ScrollArea`

- [`ScrollArea:Destroy`](components_scroll_area.md#scrollareadestroy)
- [`ScrollArea:GetContentHeight`](components_scroll_area.md#scrollareagetcontentheight)
- [`ScrollArea:GetMaxScrollOffset`](components_scroll_area.md#scrollareagetmaxscrolloffset)
- [`ScrollArea:GetScrollOffset`](components_scroll_area.md#scrollareagetscrolloffset)
- [`ScrollArea:GetScrollRatio`](components_scroll_area.md#scrollareagetscrollratio)
- [`ScrollArea:GetViewportSize`](components_scroll_area.md#scrollareagetviewportsize)
- [`ScrollArea:IsScrollable`](components_scroll_area.md#scrollareaisscrollable)
- [`ScrollArea:OnScroll`](components_scroll_area.md#scrollareaonscrollcallback)
- [`ScrollArea:RegisterControllerScrollTarget`](components_scroll_area.md#scrollarearegistercontrollerscrolltargetcontrol)
- [`ScrollArea:RegisterDragTarget`](components_scroll_area.md#scrollarearegisterdragtargetcontrol)
- [`ScrollArea:ScrollBy`](components_scroll_area.md#scrollareascrollbydelta-fireevent)
- [`ScrollArea:ScrollControlIntoView`](components_scroll_area.md#scrollareascrollcontrolintoviewtarget-padding-fireevent)
- [`ScrollArea:ScrollTo`](components_scroll_area.md#scrollareascrolltooffset-fireevent)
- [`ScrollArea:ScrollToEnd`](components_scroll_area.md#scrollareascrolltoendfireevent)
- [`ScrollArea:ScrollToRatio`](components_scroll_area.md#scrollareascrolltoratioratio-fireevent)
- [`ScrollArea:ScrollToStart`](components_scroll_area.md#scrollareascrolltostartfireevent)
- [`ScrollArea:SetContentHeight`](components_scroll_area.md#scrollareasetcontentheightheight-fireevent)
- [`ScrollArea:SetControllerScrollEnabled`](components_scroll_area.md#scrollareasetcontrollerscrollenabledenabled)
- [`ScrollArea:SetDragScrollEnabled`](components_scroll_area.md#scrollareasetdragscrollenabledenabled)
- [`ScrollArea:SetEnabled`](components_scroll_area.md#scrollareasetenabledenabled)

### `Scrollbar`

- [`Scrollbar:Destroy`](components_scrollbar.md#scrollbardestroy)
- [`Scrollbar:GetRange`](components_scrollbar.md#scrollbargetrange)
- [`Scrollbar:GetRatio`](components_scrollbar.md#scrollbargetratio)
- [`Scrollbar:GetValue`](components_scrollbar.md#scrollbargetvalue)
- [`Scrollbar:OnChange`](components_scrollbar.md#scrollbaronchangecallback)
- [`Scrollbar:ScrollBy`](components_scrollbar.md#scrollbarscrollbydelta-fireevent)
- [`Scrollbar:SetEnabled`](components_scrollbar.md#scrollbarsetenabledenabled)
- [`Scrollbar:SetPageSize`](components_scrollbar.md#scrollbarsetpagesizepagesize)
- [`Scrollbar:SetRange`](components_scrollbar.md#scrollbarsetrangeminimum-maximum-fireevent)
- [`Scrollbar:SetThumbFraction`](components_scrollbar.md#scrollbarsetthumbfractionfraction)
- [`Scrollbar:SetValue`](components_scrollbar.md#scrollbarsetvaluevalue-fireevent)

### `Selection`

- [`Selection:BuildSubmitPayload`](components_selection.md#selectionbuildsubmitpayload)
- [`Selection:CanSubmit`](components_selection.md#selectioncansubmit)
- [`Selection:Clear`](components_selection.md#selectionclearfireevent)
- [`Selection:Deselect`](components_selection.md#selectiondeselectindex-fireevent)
- [`Selection:Destroy`](components_selection.md#selectiondestroy)
- [`Selection:GetLayoutInfo`](components_selection.md#selectiongetlayoutinfo)
- [`Selection:GetSelected`](components_selection.md#selectiongetselected)
- [`Selection:GetSelectedItem`](components_selection.md#selectiongetselecteditem)
- [`Selection:GetSelectedItems`](components_selection.md#selectiongetselecteditems)
- [`Selection:GetSelectionCount`](components_selection.md#selectiongetselectioncount)
- [`Selection:IsSelected`](components_selection.md#selectionisselectedindex)
- [`Selection:OnChange`](components_selection.md#selectiononchangecallback)
- [`Selection:OnSubmit`](components_selection.md#selectiononsubmitcallback)
- [`Selection:Select`](components_selection.md#selectionselectindex-fireevent)
- [`Selection:SelectAll`](components_selection.md#selectionselectallfireevent)
- [`Selection:SetEnabled`](components_selection.md#selectionsetenabledenabled)
- [`Selection:SetItemEnabled`](components_selection.md#selectionsetitemenabledindex-enabled)
- [`Selection:SetSelected`](components_selection.md#selectionsetselectedindices-fireevent)
- [`Selection:SetSubmitButton`](components_selection.md#selectionsetsubmitbuttonbutton)
- [`Selection:Submit`](components_selection.md#selectionsubmit)
- [`Selection:Toggle`](components_selection.md#selectiontoggleindex-fireevent)

### `Session`

- [`Session.BringPageToFront`](session.md#sessionbringpagetofronthostid-pageid)
- [`Session.Clear`](session.md#sessionclear)
- [`Session.ClearPage`](session.md#sessionclearpagepageid)
- [`Session.ClearScope`](session.md#sessionclearscopescope)
- [`Session.ClosePage`](session.md#sessionclosepagehostid-pageid)
- [`Session.Get`](session.md#sessiongetkey-defaultvalue-scope)
- [`Session.GetActivePage`](session.md#sessiongetactivepagehostid)
- [`Session.GetCurrentScope`](session.md#sessiongetcurrentscope)
- [`Session.GetOpenPages`](session.md#sessiongetopenpageshostid)
- [`Session.GetScopeName`](session.md#sessiongetscopenamescope)
- [`Session.Has`](session.md#sessionhaskey-scope)
- [`Session.IsPageOpen`](session.md#sessionispageopenhostid-pageid)
- [`Session.OpenPage`](session.md#sessionopenpagehostid-pageid)
- [`Session.Remove`](session.md#sessionremovekey-scope)
- [`Session.Set`](session.md#sessionsetkey-value-scope)
- [`Session.SetCurrentScope`](session.md#sessionsetcurrentscopescope)
- [`Session.State`](session.md#sessionstatekey-defaults-scope)
- [`Session.Value`](session.md#sessionvaluekey-defaultvalue-scope)
- [`Session.WithScope`](session.md#sessionwithscopescope-callback)

### `SessionState`

- [`SessionState:Clear`](session.md#sessionstateclear)
- [`SessionState:Raw`](session.md#sessionstateraw)

### `SessionValue`

- [`SessionValue:Clear`](session.md#sessionvalueclear)
- [`SessionValue:Get`](session.md#sessionvalueget)
- [`SessionValue:Set`](session.md#sessionvaluesetvalue)
- [`SessionValue:Update`](session.md#sessionvalueupdatecallback)

### `Signals`

- [`Signals.Listen`](signals.md#signalslistenhostid-signalname-callback)

### `Slider`

- [`Slider:Destroy`](components_base.md#sliderdestroy)
- [`Slider:GetRatio`](components_base.md#slidergetratio)
- [`Slider:GetValue`](components_base.md#slidergetvalue)
- [`Slider:OnChange`](components_base.md#slideronchangecallback)
- [`Slider:OnCommit`](components_base.md#slideroncommitcallback)
- [`Slider:SetEnabled`](components_base.md#slidersetenabledenabled)
- [`Slider:SetValue`](components_base.md#slidersetvaluevalue-fireevent-animate)

### `Stack`

- [`Stack:Add`](helpers.md#stackaddvalue-options)
- [`Stack:Batch`](helpers.md#stackbatchcallback)
- [`Stack:Clear`](helpers.md#stackclear)
- [`Stack:Destroy`](helpers.md#stackdestroy)
- [`Stack:Refresh`](helpers.md#stackrefresh)
- [`Stack:RefreshControllerNavigation`](stack_extensions.md#stackrefreshcontrollernavigation)
- [`Stack:Remove`](helpers.md#stackremovevalue)
- [`Stack:ReplaceChildren`](stack_extensions.md#stackreplacechildrenbuilder)
- [`Stack:SetAlign`](helpers.md#stacksetalignalign)
- [`Stack:SetChildResponsive`](stack_extensions.md#stacksetchildresponsivevalue-rules)
- [`Stack:SetControllerNavigationEnabled`](stack_extensions.md#stacksetcontrollernavigationenabledenabled)
- [`Stack:SetDirection`](stack_extensions.md#stacksetdirectiondirection)
- [`Stack:SetGap`](helpers.md#stacksetgapgap)
- [`Stack:SetInsets`](helpers.md#stacksetinsetsleft-right-top-bottom)
- [`Stack:SetJustify`](helpers.md#stacksetjustifyjustify)
- [`Stack:SetPadding`](helpers.md#stacksetpaddingpadding)
- [`Stack:SetResponsive`](stack_extensions.md#stacksetresponsiverules)

### `StackClass`

- [`StackClass.New`](helpers.md#stackclassnewroot-direction-options)

### `Stat`

- [`Stat:Destroy`](components_base.md#statdestroy)
- [`Stat:SetLabel`](components_base.md#statsetlabelspec)
- [`Stat:SetValue`](components_base.md#statsetvaluespec)

### `Stepper`

- [`Stepper:Destroy`](components_advanced.md#stepperdestroy)
- [`Stepper:GetValue`](components_advanced.md#steppergetvalue)
- [`Stepper:OnChange`](components_advanced.md#stepperonchangecallback)
- [`Stepper:SetEnabled`](components_advanced.md#steppersetenabledenabled)
- [`Stepper:SetValue`](components_advanced.md#steppersetvaluevalue-fireevent)

### `StyleAPI`

- [`StyleAPI.Color`](helpers.md#styleapicolorname-fallback)
- [`StyleAPI.Merge`](helpers.md#styleapimergeprops-componentname)
- [`StyleAPI.Parse`](helpers.md#styleapiparseclassstring)
- [`StyleAPI.SurfaceImage`](helpers.md#styleapisurfaceimagestyle-outline)

### `Subscription`

- [`Subscription:Disconnect`](signals.md#subscriptiondisconnect)
- [`Subscription:IsConnected`](signals.md#subscriptionisconnected)

### `SurfaceAPI`

- [`SurfaceAPI.EdgeLevel`](helpers.md#surfaceapiedgelevellevel-outline)
- [`SurfaceAPI.GetRoundedLevel`](helpers.md#surfaceapigetroundedlevelassetid)
- [`SurfaceAPI.MatchingShell`](helpers.md#surfaceapimatchingshellroundedassetid-outline)
- [`SurfaceAPI.ResolveLevel`](helpers.md#surfaceapiresolvelevelradius)
- [`SurfaceAPI.Rounded`](helpers.md#surfaceapiroundedradius-outline)
- [`SurfaceAPI.RoundedLevel`](helpers.md#surfaceapiroundedlevellevel-outline)
- [`SurfaceAPI.Shell`](helpers.md#surfaceapishellradius-outline)
- [`SurfaceAPI.ShellLevel`](helpers.md#surfaceapishelllevellevel-outline)

### `Tabs`

- [`Tabs:Destroy`](components_advanced.md#tabsdestroy)
- [`Tabs:GetContent`](components_advanced.md#tabsgetcontentindex)
- [`Tabs:GetSelected`](components_advanced.md#tabsgetselected)
- [`Tabs:OnChange`](components_advanced.md#tabsonchangecallback)
- [`Tabs:SetEnabled`](components_advanced.md#tabssetenabledenabled)
- [`Tabs:SetItemLabel`](components_advanced.md#tabssetitemlabelindex-spec)
- [`Tabs:SetSelected`](components_advanced.md#tabssetselectedindex-fireevent)

### `TextMetricsAPI`

- [`TextMetricsAPI.EstimateWrappedHeight`](text_metrics.md#textmetricsapiestimatewrappedheighttext-fontsize-width-horizontalinset)
- [`TextMetricsAPI.EstimateWrappedLineCount`](text_metrics.md#textmetricsapiestimatewrappedlinecounttext-fontsize-width-horizontalinset)
- [`TextMetricsAPI.GetMetadata`](text_metrics.md#textmetricsapigetmetadatavalue)
- [`TextMetricsAPI.GetRequiredHeight`](text_metrics.md#textmetricsapigetrequiredheightvalue)
- [`TextMetricsAPI.Measure`](text_metrics.md#textmetricsapimeasurevalue)
- [`TextMetricsAPI.SafeTextHeight`](text_metrics.md#textmetricsapisafetextheightfontsize)
- [`TextMetricsAPI.SafeTextWindowHeight`](text_metrics.md#textmetricsapisafetextwindowheightfontsize)

### `TextWindow`

- [`TextWindow:Destroy`](components_native.md#textwindowdestroy)
- [`TextWindow:SetEnabled`](components_native.md#textwindowsetenabledenabled)
- [`TextWindow:SetScrollBarVisible`](components_native.md#textwindowsetscrollbarvisiblevisible)
- [`TextWindow:SetText`](components_native.md#textwindowsettextspec)

### `Theme`

- [`Theme.Apply`](theme.md#themeapplytheme)
- [`Theme.Reset`](theme.md#themereset)

### `Toast`

- [`Toast:Close`](components_feedback.md#toastclose)

### `ToastManager`

- [`ToastManager:Clear`](components_feedback.md#toastmanagerclear)
- [`ToastManager:Destroy`](components_feedback.md#toastmanagerdestroy)
- [`ToastManager:Show`](components_feedback.md#toastmanagershowoptions)

### `Toggle`

- [`Toggle:Destroy`](components_advanced.md#toggledestroy)
- [`Toggle:GetValue`](components_advanced.md#togglegetvalue)
- [`Toggle:OnChange`](components_advanced.md#toggleonchangecallback)
- [`Toggle:SetEnabled`](components_advanced.md#togglesetenabledenabled)
- [`Toggle:SetLabel`](components_advanced.md#togglesetlabelspec)
- [`Toggle:SetValue`](components_advanced.md#togglesetvaluevalue-fireevent-animate)
- [`Toggle:Toggle`](components_advanced.md#toggletogglefireevent)

### `Tooltip`

- [`Tooltip:Close`](components_anchored_overlay.md#tooltipclose)
- [`Tooltip:Destroy`](components_anchored_overlay.md#tooltipdestroy)
- [`Tooltip:IsOpen`](components_anchored_overlay.md#tooltipisopen)
- [`Tooltip:Open`](components_anchored_overlay.md#tooltipopen)
- [`Tooltip:RefreshPlacement`](components_anchored_overlay.md#tooltiprefreshplacement)
- [`Tooltip:SetText`](components_anchored_overlay.md#tooltipsettextspec)

### `Variables`

- [`Variables.Get`](variables.md#variablesgetentitytype-customvariablename)
- [`Variables.Watch`](variables.md#variableswatchhostid-entitytype-customvariablename-callback-options)


## Named types (props, callbacks, return objects and enums)

Search this list for `MiliUI.ButtonProps`, `MiliUI.SelectionProps`, `MiliUI.PageContext`, and other declared types. Each class shows **all directly declared fields** and a link to its inherited base type when present.

- [`MiliUI`](api.md#miliui)
- [`MiliUI.Accordion`](components_advanced.md#miliuiaccordion)
- [`MiliUI.AccordionProps`](components_advanced.md#miliuiaccordionprops)
- [`MiliUI.Alert`](components_feedback.md#miliuialert)
- [`MiliUI.AlertProps`](components_feedback.md#miliuialertprops)
- [`MiliUI.AnchorPlacementResult`](components_anchored_overlay.md#miliuianchorplacementresult)
- [`MiliUI.Animation`](components_native.md#miliuianimation)
- [`MiliUI.AnimationControl`](native.md#miliuianimationcontrol)
- [`MiliUI.AnimationProps`](components_native.md#miliuianimationprops)
- [`MiliUI.AudioAPI`](helpers.md#miliuiaudioapi)
- [`MiliUI.Badge`](components_base.md#miliuibadge)
- [`MiliUI.BadgeProps`](components_base.md#miliuibadgeprops)
- [`MiliUI.Binding`](helpers.md#miliuibinding)
- [`MiliUI.BoxProps`](aliases.md#miliuiboxprops)
- [`MiliUI.Button`](components_base.md#miliuibutton)
- [`MiliUI.ButtonControl`](native.md#miliuibuttoncontrol)
- [`MiliUI.ButtonProps`](components_base.md#miliuibuttonprops)
- [`MiliUI.ButtonStates`](components_base.md#miliuibuttonstates)
- [`MiliUI.ButtonVariantStyle`](theme.md#miliuibuttonvariantstyle)
- [`MiliUI.CardProps`](components_base.md#miliuicardprops)
- [`MiliUI.Checkbox`](components_advanced.md#miliuicheckbox)
- [`MiliUI.CheckboxProps`](components_advanced.md#miliuicheckboxprops)
- [`MiliUI.ContainerControl`](native.md#miliuicontainercontrol)
- [`MiliUI.Control`](native.md#miliuicontrol)
- [`MiliUI.ControllerFocusIndicatorAnimationProps`](components_base.md#miliuicontrollerfocusindicatoranimationprops)
- [`MiliUI.ControllerFocusIndicatorProps`](components_base.md#miliuicontrollerfocusindicatorprops)
- [`MiliUI.CoreAPI`](helpers.md#miliuicoreapi)
- [`MiliUI.CursorAreaControl`](native.md#miliuicursorareacontrol)
- [`MiliUI.CursorEventData`](native.md#miliuicursoreventdata)
- [`MiliUI.DataViewComparatorSortSpec`](components_data_views.md#miliuidataviewcomparatorsortspec)
- [`MiliUI.DataViewSortSpec`](components_data_views.md#miliuidataviewsortspec)
- [`MiliUI.DiagnosticsAPI`](responsive.md#miliuidiagnosticsapi)
- [`MiliUI.Dropdown`](components_dropdown.md#miliuidropdown)
- [`MiliUI.DropdownItem`](components_dropdown.md#miliuidropdownitem)
- [`MiliUI.DropdownOption`](components_dropdown.md#miliuidropdownoption)
- [`MiliUI.DropdownParameter`](components_dropdown.md#miliuidropdownparameter)
- [`MiliUI.DropdownPayload`](components_dropdown.md#miliuidropdownpayload)
- [`MiliUI.DropdownProps`](components_dropdown.md#miliuidropdownprops)
- [`MiliUI.DropdownSubmit`](components_dropdown.md#miliuidropdownsubmit)
- [`MiliUI.DropdownSubmitField`](components_dropdown.md#miliuidropdownsubmitfield)
- [`MiliUI.FanLayoutOptions`](helpers.md#miliuifanlayoutoptions)
- [`MiliUI.FullscreenAnimation`](components_native.md#miliuifullscreenanimation)
- [`MiliUI.FullscreenAnimationControl`](native.md#miliuifullscreenanimationcontrol)
- [`MiliUI.FullscreenAnimationProps`](components_native.md#miliuifullscreenanimationprops)
- [`MiliUI.GridLayoutOptions`](helpers.md#miliuigridlayoutoptions)
- [`MiliUI.GridScroller`](components_native.md#miliuigridscroller)
- [`MiliUI.GridScrollerControl`](native.md#miliuigridscrollercontrol)
- [`MiliUI.GridScrollerProps`](components_native.md#miliuigridscrollerprops)
- [`MiliUI.Hitbox`](helpers.md#miliuihitbox)
- [`MiliUI.HitboxCallbacks`](helpers.md#miliuihitboxcallbacks)
- [`MiliUI.HitboxProps`](helpers.md#miliuihitboxprops)
- [`MiliUI.HostsAPI`](hosts.md#miliuihostsapi)
- [`MiliUI.Hover`](helpers.md#miliuihover)
- [`MiliUI.HoverProps`](helpers.md#miliuihoverprops)
- [`MiliUI.IconButtonProps`](components_base.md#miliuiiconbuttonprops)
- [`MiliUI.IconProps`](aliases.md#miliuiiconprops)
- [`MiliUI.ImageControl`](native.md#miliuiimagecontrol)
- [`MiliUI.ImageProps`](aliases.md#miliuiimageprops)
- [`MiliUI.InteractionAPI`](helpers.md#miliuiinteractionapi)
- [`MiliUI.InteractiveVisualState`](components_base.md#miliuiinteractivevisualstate)
- [`MiliUI.KeyBinding`](helpers.md#miliuikeybinding)
- [`MiliUI.KeyHint`](components_native.md#miliuikeyhint)
- [`MiliUI.KeyHintControl`](native.md#miliuikeyhintcontrol)
- [`MiliUI.KeyHintProps`](components_native.md#miliuikeyhintprops)
- [`MiliUI.LayoutAPI`](helpers.md#miliuilayoutapi)
- [`MiliUI.LayoutBounds`](responsive.md#miliuilayoutbounds)
- [`MiliUI.LayoutDiagnosticOptions`](responsive.md#miliuilayoutdiagnosticoptions)
- [`MiliUI.LayoutIssue`](responsive.md#miliuilayoutissue)
- [`MiliUI.LayoutOptions`](helpers.md#miliuilayoutoptions)
- [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops)
- [`MiliUI.LayoutWatcher`](responsive.md#miliuilayoutwatcher)
- [`MiliUI.ListView`](components_data_views.md#miliuilistview)
- [`MiliUI.ListViewEntry`](components_data_views.md#miliuilistviewentry)
- [`MiliUI.ListViewProps`](components_data_views.md#miliuilistviewprops)
- [`MiliUI.LocalizationAPI`](localization.md#miliuilocalizationapi)
- [`MiliUI.Modal`](components_feedback.md#miliuimodal)
- [`MiliUI.ModalProps`](components_feedback.md#miliuimodalprops)
- [`MiliUI.MotionAPI`](helpers.md#miliuimotionapi)
- [`MiliUI.MotionBounceInOptions`](helpers.md#miliuimotionbounceinoptions)
- [`MiliUI.MotionBreatheOptions`](helpers.md#miliuimotionbreatheoptions)
- [`MiliUI.MotionDropInOptions`](helpers.md#miliuimotiondropinoptions)
- [`MiliUI.MotionFlipOptions`](helpers.md#miliuimotionflipoptions)
- [`MiliUI.MotionHopOptions`](helpers.md#miliuimotionhopoptions)
- [`MiliUI.MotionNudgeOptions`](helpers.md#miliuimotionnudgeoptions)
- [`MiliUI.MotionPopOptions`](helpers.md#miliuimotionpopoptions)
- [`MiliUI.MotionPulseOptions`](helpers.md#miliuimotionpulseoptions)
- [`MiliUI.MotionPunchOptions`](helpers.md#miliuimotionpunchoptions)
- [`MiliUI.MotionRubberBandOptions`](helpers.md#miliuimotionrubberbandoptions)
- [`MiliUI.MotionShakeOptions`](helpers.md#miliuimotionshakeoptions)
- [`MiliUI.MotionSlamOptions`](helpers.md#miliuimotionslamoptions)
- [`MiliUI.MotionSlideInOptions`](helpers.md#miliuimotionslideinoptions)
- [`MiliUI.MotionSpinInOptions`](helpers.md#miliuimotionspininoptions)
- [`MiliUI.MotionSquashOptions`](helpers.md#miliuimotionsquashoptions)
- [`MiliUI.MotionSwingOptions`](helpers.md#miliuimotionswingoptions)
- [`MiliUI.MotionWobbleOptions`](helpers.md#miliuimotionwobbleoptions)
- [`MiliUI.NavigationAPI`](navigation.md#miliuinavigationapi)
- [`MiliUI.NavigationTransitionOptions`](navigation.md#miliuinavigationtransitionoptions)
- [`MiliUI.PageContext`](pages.md#miliuipagecontext)
- [`MiliUI.PageDefinition`](pages.md#miliuipagedefinition)
- [`MiliUI.PageHandle`](pages.md#miliuipagehandle)
- [`MiliUI.PagesAPI`](pages.md#miliuipagesapi)
- [`MiliUI.Panel`](components_base.md#miliuipanel)
- [`MiliUI.ParsedStyle`](helpers.md#miliuiparsedstyle)
- [`MiliUI.PlayerAPI`](player.md#miliuiplayerapi)
- [`MiliUI.PlayingCard`](components_playing_card.md#miliuiplayingcard)
- [`MiliUI.PlayingCardArtworkProps`](components_playing_card.md#miliuiplayingcardartworkprops)
- [`MiliUI.PlayingCardBackProps`](components_playing_card.md#miliuiplayingcardbackprops)
- [`MiliUI.PlayingCardHeaderProps`](components_playing_card.md#miliuiplayingcardheaderprops)
- [`MiliUI.PlayingCardHoverProps`](components_playing_card.md#miliuiplayingcardhoverprops)
- [`MiliUI.PlayingCardProps`](components_playing_card.md#miliuiplayingcardprops)
- [`MiliUI.PlayingCardSlotHandles`](components_playing_card.md#miliuiplayingcardslothandles)
- [`MiliUI.PlayingCardSlots`](components_playing_card.md#miliuiplayingcardslots)
- [`MiliUI.Popover`](components_anchored_overlay.md#miliuipopover)
- [`MiliUI.PopoverProps`](components_anchored_overlay.md#miliuipopoverprops)
- [`MiliUI.ProgressBar`](components_base.md#miliuiprogressbar)
- [`MiliUI.ProgressBarProps`](components_base.md#miliuiprogressbarprops)
- [`MiliUI.RememberOptions`](aliases.md#miliuirememberoptions)
- [`MiliUI.Repeater`](components_data_views.md#miliuirepeater)
- [`MiliUI.RepeaterEntry`](components_data_views.md#miliuirepeaterentry)
- [`MiliUI.RepeaterProps`](components_data_views.md#miliuirepeaterprops)
- [`MiliUI.ResponsiveChildOptions`](responsive.md#miliuiresponsivechildoptions)
- [`MiliUI.ResponsiveClass`](responsive.md#miliuiresponsiveclass)
- [`MiliUI.ResponsiveLayout`](responsive.md#miliuiresponsivelayout)
- [`MiliUI.ResponsiveLayoutInfo`](responsive.md#miliuiresponsivelayoutinfo)
- [`MiliUI.ResponsiveProps`](responsive.md#miliuiresponsiveprops)
- [`MiliUI.ResponsiveRule`](responsive_props.md#miliuiresponsiverule)
- [`MiliUI.ResponsiveWhen`](responsive_props.md#miliuiresponsivewhen)
- [`MiliUI.Screen`](components_screen.md#miliuiscreen)
- [`MiliUI.ScreenInputCapture`](components_screen.md#miliuiscreeninputcapture)
- [`MiliUI.ScreenProps`](components_screen.md#miliuiscreenprops)
- [`MiliUI.ScreenQuery`](components_screen.md#miliuiscreenquery)
- [`MiliUI.ScrollArea`](components_scroll_area.md#miliuiscrollarea)
- [`MiliUI.ScrollAreaBindContentOptions`](intrinsic.md#miliuiscrollareabindcontentoptions)
- [`MiliUI.ScrollAreaProps`](components_scroll_area.md#miliuiscrollareaprops)
- [`MiliUI.Scrollbar`](components_scrollbar.md#miliuiscrollbar)
- [`MiliUI.ScrollbarProps`](components_scrollbar.md#miliuiscrollbarprops)
- [`MiliUI.ScrollColumnProps`](intrinsic.md#miliuiscrollcolumnprops)
- [`MiliUI.Selection`](components_selection.md#miliuiselection)
- [`MiliUI.SelectionChoice`](components_selection.md#miliuiselectionchoice)
- [`MiliUI.SelectionItem`](components_selection.md#miliuiselectionitem)
- [`MiliUI.SelectionItemStyle`](components_selection.md#miliuiselectionitemstyle)
- [`MiliUI.SelectionLayoutInfo`](components_selection.md#miliuiselectionlayoutinfo)
- [`MiliUI.SelectionParameter`](components_selection.md#miliuiselectionparameter)
- [`MiliUI.SelectionPayload`](components_selection.md#miliuiselectionpayload)
- [`MiliUI.SelectionProps`](components_selection.md#miliuiselectionprops)
- [`MiliUI.SelectionState`](components_selection.md#miliuiselectionstate)
- [`MiliUI.SelectionSubmit`](components_selection.md#miliuiselectionsubmit)
- [`MiliUI.SelectionSubmitField`](components_selection.md#miliuiselectionsubmitfield)
- [`MiliUI.SessionAPI`](session.md#miliuisessionapi)
- [`MiliUI.SessionState`](session.md#miliuisessionstate)
- [`MiliUI.SessionValue`](session.md#miliuisessionvalue)
- [`MiliUI.ShellProps`](components_feedback.md#miliuishellprops)
- [`MiliUI.SignalsAPI`](signals.md#miliuisignalsapi)
- [`MiliUI.Slider`](components_base.md#miliuislider)
- [`MiliUI.SliderProps`](components_base.md#miliuisliderprops)
- [`MiliUI.Stack`](helpers.md#miliuistack)
- [`MiliUI.StackChildOptions`](helpers.md#miliuistackchildoptions)
- [`MiliUI.StackChildResponsiveProps`](stack_extensions.md#miliuistackchildresponsiveprops)
- [`MiliUI.StackChildResponsiveRule`](stack_extensions.md#miliuistackchildresponsiverule)
- [`MiliUI.StackClass`](helpers.md#miliuistackclass)
- [`MiliUI.StackProps`](helpers.md#miliuistackprops)
- [`MiliUI.StackResponsiveProps`](stack_extensions.md#miliuistackresponsiveprops)
- [`MiliUI.StackResponsiveRule`](stack_extensions.md#miliuistackresponsiverule)
- [`MiliUI.StackResponsiveWhen`](stack_extensions.md#miliuistackresponsivewhen)
- [`MiliUI.Stat`](components_base.md#miliuistat)
- [`MiliUI.StateTargetStates`](components_base.md#miliuistatetargetstates)
- [`MiliUI.StateTargetVisual`](components_base.md#miliuistatetargetvisual)
- [`MiliUI.StatProps`](components_base.md#miliuistatprops)
- [`MiliUI.Stepper`](components_advanced.md#miliuistepper)
- [`MiliUI.StepperProps`](components_advanced.md#miliuistepperprops)
- [`MiliUI.StyleAPI`](helpers.md#miliuistyleapi)
- [`MiliUI.Subscription`](signals.md#miliuisubscription)
- [`MiliUI.SurfaceAPI`](helpers.md#miliuisurfaceapi)
- [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops)
- [`MiliUI.SurfaceRadiusMap`](helpers.md#miliuisurfaceradiusmap)
- [`MiliUI.TabItem`](components_advanced.md#miliuitabitem)
- [`MiliUI.Tabs`](components_advanced.md#miliuitabs)
- [`MiliUI.TabsProps`](components_advanced.md#miliuitabsprops)
- [`MiliUI.Templates`](aliases.md#miliuitemplates)
- [`MiliUI.TextControl`](native.md#miliuitextcontrol)
- [`MiliUI.TextGeometryIssue`](text_metrics.md#miliuitextgeometryissue)
- [`MiliUI.TextGeometryOptions`](text_metrics.md#miliuitextgeometryoptions)
- [`MiliUI.TextMeasurement`](text_metrics.md#miliuitextmeasurement)
- [`MiliUI.TextMetricsAPI`](text_metrics.md#miliuitextmetricsapi)
- [`MiliUI.TextMetricsMetadata`](text_metrics.md#miliuitextmetricsmetadata)
- [`MiliUI.TextProps`](aliases.md#miliuitextprops)
- [`MiliUI.TextSpec`](aliases.md#miliuitextspec)
- [`MiliUI.TextWindow`](components_native.md#miliuitextwindow)
- [`MiliUI.TextWindowControl`](native.md#miliuitextwindowcontrol)
- [`MiliUI.TextWindowProps`](components_native.md#miliuitextwindowprops)
- [`MiliUI.Theme`](theme.md#miliuitheme)
- [`MiliUI.ThemeAssets`](theme.md#miliuithemeassets)
- [`MiliUI.ThemeButtonVariants`](theme.md#miliuithemebuttonvariants)
- [`MiliUI.ThemeColors`](theme.md#miliuithemecolors)
- [`MiliUI.ThemeComponents`](theme.md#miliuithemecomponents)
- [`MiliUI.ThemeControllerFocusIndicator`](theme.md#miliuithemecontrollerfocusindicator)
- [`MiliUI.ThemeControllerFocusIndicatorAnimation`](theme.md#miliuithemecontrollerfocusindicatoranimation)
- [`MiliUI.ThemeMotion`](theme.md#miliuithememotion)
- [`MiliUI.ThemePatch`](theme.md#miliuithemepatch)
- [`MiliUI.ThemeScrollbar`](theme.md#miliuithemescrollbar)
- [`MiliUI.ThemeSounds`](theme.md#miliuithemesounds)
- [`MiliUI.ThemeSpacing`](theme.md#miliuithemespacing)
- [`MiliUI.ThemeTextSize`](theme.md#miliuithemetextsize)
- [`MiliUI.Toast`](components_feedback.md#miliuitoast)
- [`MiliUI.ToastManager`](components_feedback.md#miliuitoastmanager)
- [`MiliUI.ToastManagerProps`](components_feedback.md#miliuitoastmanagerprops)
- [`MiliUI.ToastOptions`](components_feedback.md#miliuitoastoptions)
- [`MiliUI.Toggle`](components_advanced.md#miliuitoggle)
- [`MiliUI.ToggleProps`](components_advanced.md#miliuitoggleprops)
- [`MiliUI.Tooltip`](components_anchored_overlay.md#miliuitooltip)
- [`MiliUI.TooltipProps`](components_anchored_overlay.md#miliuitooltipprops)
- [`MiliUI.VariablesAPI`](variables.md#miliuivariablesapi)
- [`MiliUI.VariableWatchOptions`](variables.md#miliuivariablewatchoptions)

## Aliases and allowed values

- [`MiliUI.AlertVariant`](aliases.md#miliuialertvariant)
- [`MiliUI.AnchorAlign`](components_anchored_overlay.md#miliuianchoralign)
- [`MiliUI.AnchorPlacement`](components_anchored_overlay.md#miliuianchorplacement)
- [`MiliUI.ButtonVariant`](aliases.md#miliuibuttonvariant)
- [`MiliUI.Color`](aliases.md#miliuicolor)
- [`MiliUI.ColorName`](aliases.md#miliuicolorname)
- [`MiliUI.ColorValue`](aliases.md#miliuicolorvalue)
- [`MiliUI.CursorCallback`](native.md#miliuicursorcallback)
- [`MiliUI.DataViewDirection`](components_data_views.md#miliuidataviewdirection)
- [`MiliUI.DataViewSort`](components_data_views.md#miliuidataviewsort)
- [`MiliUI.DataViewSortOrder`](components_data_views.md#miliuidataviewsortorder)
- [`MiliUI.Dimension`](aliases.md#miliuidimension)
- [`MiliUI.DropdownValueType`](components_dropdown.md#miliuidropdownvaluetype)
- [`MiliUI.MotionChannel`](helpers.md#miliuimotionchannel)
- [`MiliUI.MotionDirection`](helpers.md#miliuimotiondirection)
- [`MiliUI.NativeControl`](aliases.md#miliuinativecontrol)
- [`MiliUI.Parent`](aliases.md#miliuiparent)
- [`MiliUI.PlayingCardSlotRenderer`](components_playing_card.md#miliuiplayingcardslotrenderer)
- [`MiliUI.Radius`](aliases.md#miliuiradius)
- [`MiliUI.RememberSpec`](aliases.md#miliuirememberspec)
- [`MiliUI.RepeaterKey`](components_data_views.md#miliuirepeaterkey)
- [`MiliUI.ResponsiveOrientation`](responsive_props.md#miliuiresponsiveorientation)
- [`MiliUI.ResponsiveOverflowMode`](responsive.md#miliuiresponsiveoverflowmode)
- [`MiliUI.ScreenOrientation`](aliases.md#miliuiscreenorientation)
- [`MiliUI.SelectionValueType`](components_selection.md#miliuiselectionvaluetype)
- [`MiliUI.ShellMode`](aliases.md#miliuishellmode)
- [`MiliUI.StackAlign`](aliases.md#miliuistackalign)
- [`MiliUI.StackJustify`](aliases.md#miliuistackjustify)
- [`MiliUI.TextSize`](aliases.md#miliuitextsize)
- [`MiliUI.ThemeComponentName`](aliases.md#miliuithemecomponentname)

## Maintenance and accuracy

- **Source of truth:** private Development repository `library/*.lua`, copied into the VS Code IntelliSense extension at build time.
- **Generation:** run `python tools/generate_api_reference.py` in Development; run with `--check` to detect stale committed output.
- **Inherited properties:** navigate to the base class shown on each props table rather than assuming the child has only its directly listed fields.
- **Defaults:** only defaults explicitly described by declaration comments or guides should be treated as documented.
- **Missing details:** if a declaration does not describe something, the reference identifies that rather than guessing. Report omissions so IntelliSense and this reference improve together.
- **Runtime API:** the MiliUI reference does not replace Miliastra’s engine API docs.
