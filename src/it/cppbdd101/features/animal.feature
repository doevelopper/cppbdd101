# language: en

Feature: Creating animal
    Blablabla
    
    Scenario: Brake report published after an interval
        When a brake report is published
        Then a brake report should be put on the control CAN bus
        And the brake report's fields should be set