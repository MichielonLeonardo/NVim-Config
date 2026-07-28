return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require('orgmode').setup({
        org_agenda_files = { '~/Sync/Brain/agenda/**/*' },
        org_default_notes_file = '~/Sync/Brain/agenda/refile.org',
        org_todo_keywords = { 'TODO(t)', 'STUDY(s)', 'PROJECT(p)', 'WAIT(w)', '|', 'DONE(d)', 'CANCEL(c)' },
        
        org_capture_templates = {
          t = { description = 'Task Personale', template = '* TODO %?\n  %u', target = '~/Sync/Brain/agenda/vita.org' },
          s = { description = 'Studio', template = '*** STUDY %?\n    SCHEDULED: %^t DEADLINE: %^t\n    :PROPERTIES:\n    :EFFORT: 1h\n    :END:\n    %i', target = '~/Sync/Brain/agenda/studio.org', headline = 'Inbox Studio' },
          p = { description = 'Progetto Coding', template = '* PROJECT %?\n  %u\n  ** TODO Milestone 1', target = '~/Sync/Brain/agenda/progetti.org' },
          j = { description = 'Journal', template = '* %U - %?\n  %i', target = '~/Sync/Brain/agenda/journal.org' },
          l = { description = 'Lista Spesa', template = '- [ ] %?', target = '~/Sync/Brain/agenda/vita.org', headline = 'Spesa' }
        },
        
        -- Rispetta la sintassi [chiave] = valore per i percorsi specifici in Lua
        org_refile_targets = { 
          ['~/Sync/Brain/agenda/studio.org'] = { max_level = 2 } 
        },
        
        mappings = {
          agenda = { org_agenda = '<leader>oa' },
          capture = { org_capture = '<leader>oc' },
          org = {
            org_refile = '<leader>or', 
            org_set_tags = '<leader>ot',
            org_priority = '<leader>op', 
            org_deadline = '<leader>id', 
            org_schedule = '<leader>is',
          }
        },
      })
    end
  }
}
