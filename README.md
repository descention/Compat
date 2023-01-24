# Compat

Compatibility addon for World of Warcraft client version 5.4.8, Mists of Pandaria. This addon supports unmodified addons targeting client version 7.3.5, Legion.

The following addons have partial support:
* TradeSkillMaster 3.6.43 & 3.6.45
  * Most functionality seems to work, there are a few bugs still
    * Group item import may be broken
    * Sometimes an error will show on load due to the static table having item ids that don't exist in 5.4.8
    * May need to adjust a saved variable if you're not using the TSM App, the AuctionDB addon assumes you have AppData
  * TradeSkillMaster_Crafting module has not supported yet and has many bugs
