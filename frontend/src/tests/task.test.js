import { describe, it, expect } from 'vitest'
import { getTaskStatus } from '../utils/task'

describe('getTaskStatus', () => {
  it('mengembalikan status task jika tersedia', () => {
    const task = {
      id: 1,
      title: 'Sains Data',
      status: 'Pending',
    }

    expect(getTaskStatus(task)).toBe('Pending')
  })

  it('mengembalikan Pending jika status tidak tersedia', () => {
    const task = {
      id: 2,
      title: 'Pemrograman Web',
    }

    expect(getTaskStatus(task)).toBe('Pending')
  })
})